const path = require("path");
const glob = require("glob");
const FriendlyErrorsWebpackPlugin = require("friendly-errors-webpack-plugin");
const ManifestPlugin = require("webpack-manifest-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const PrettierPlugin = require("prettier-webpack-plugin");
const eslintConfig = require("./eslint.config");

// TODO
// - Add typescript support

// Path to slices
// We expect that asset will exist at /:slice/assets/:entry
const slicesPath = path.join(__dirname, "../slices");

module.exports = function config(mode) {
  // Find the entry points for each slice and create a set of entries with a
  // consistent naming convention so we can easily reference in templates:
  // `${sliceName}__${entryName}`
  const entry = glob
    .sync(`${slicesPath}/*`)
    .map(dir => {
      const sliceName = path.basename(dir);
      const entries = glob.sync(dir + "/**/entry.js");
      return entries.map(entry => {
        const entryName = path.basename(path.dirname(entry));
        return [`${sliceName}__${entryName}`, entry];
      });
    })
    // Flatten
    .reduce((a, b) => a.concat(b), [])
    // Turn into `entry` object
    .reduce((output, entry) => {
      const [name, location] = entry;
      output[name] = [location];
      return output;
    }, {});

  const linterRules =
    mode === "development"
      ? [
          // First, run the linter.
          // It's important to do this before Babel processes the JS.
          {
            test: /\.(js|jsx)$/,
            enforce: "pre",
            use: [
              {
                // Point ESLint to our predefined config.
                options: {
                  baseConfig: eslintConfig(mode),
                  useEslintrc: false,
                  // Automatically fix eslint-issues (i.e., run through prettier)
                  fix: true
                },
                loader: "eslint-loader"
              }
            ],
            include: slicesPath
          }
        ]
      : [];

  const prependPlugins =
    mode === "development"
      ? [
          // Friendlier error messages
          new FriendlyErrorsWebpackPlugin(),
          // Format CSS with Prettier. JS is handled through the eslint-loader
          // (so that we can mix in other eslint configuration)
          new PrettierPlugin({
            extensions: [".css"]
          })
        ]
      : [];

  return {
    entry,
    mode,
    module: {
      rules: [
        ...linterRules,
        // Use babel for *anything* matching *.es.js, including within
        // other dependencies in node_modules.
        {
          test: /\.es\.js$/,
          loader: "babel-loader",
        },
        {
          test: /\.esm\.js$/,
          loader: "babel-loader",
        },
        {
          test: /\.js$/,
          exclude: /node_modules/,
          loader: "babel-loader",
        },
        {
          test: /\.(png|jpe?g|gif|svg|woff2?|mp3|mp4|webm|webp|woff|woff2|mp4|m4v|pdf)$/,
          loader: "file-loader",
          options: {
            name:
              mode === "development"
                ? "[path][name].[ext]"
                : "[path][name].[contenthash].[ext]",
          },
        },
        {
          test: /\.css$/,
          use: [
            {
              loader: MiniCssExtractPlugin.loader,
              options: {
                hmr: mode === "development",
              },
            },
            { loader: "css-loader", options: { importLoaders: 1 } },
            {
              loader: "postcss-loader",
              options: {
                config: {
                  path: path.resolve(__dirname),
                },
              },
            },
          ],
        },
      ],
    },
    output: {
      filename: mode === "development" ? "[name].js" : "[name].[chunkhash].js",
      path:
        mode === "development"
          ? path.resolve(__dirname, "./tmp/assets")
          : path.resolve(__dirname, "..", "./public/assets"),
      publicPath:
        mode === "development"
          ? `http://localhost:${process.env.PORT}/assets/`
          : "/assets/",
    },
    resolve: {
      mainFields: ["module", "main"],
    },
    plugins: [
      ...prependPlugins,
      new MiniCssExtractPlugin({
        chunkFilename: "[id].[chunkhash].css",
        ignoreOrder: false,
        filename:
          mode === "development" ? "[name].css" : "[name].[chunkhash].css",
      }),
      new ManifestPlugin({
        fileName: "manifest.json",
      }),
    ],
  };
};
