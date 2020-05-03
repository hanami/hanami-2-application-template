const path = require("path");
const rimraf = require("rimraf");
const chalk = require("chalk");
const webpack = require("webpack");
const config = require("../webpack.config.js");

/*
Build webpack bundle

- 🔥 whatever is currently in `output`
- Build both Webpack configs into `output`
- Call the default export of the prerender bundle
- Watch for changes, rinse & repeat

That's all. You won't even find a dev server in here!
**********************************************************/

const mode = process.argv[2];
const bundleConfig = config(mode);

if (bundleConfig.output.path != null) {
  rimraf(path.resolve(bundleConfig.output.path, "./*"), err => {
    if (err) {
      console.error(chalk.red(error));
      process.exit();
    }

    const mode = process.argv[2];
    const compiler = webpack([bundleConfig]);

    const watching = compiler.watch({}, (err, compilation) => {
      // TODO handle logging better to avoid lots of noise
      let hasErrors = !!err;

      const statsArray = compilation.stats;

      statsArray.forEach(stats => {
        if (stats.compilation.errors && stats.compilation.errors.length)
          hasErrors = true;
        console.log(stats.toString({ colors: true }));
      });

      if (mode === "production") {
        watching.close();
      }
    });
  });
}
