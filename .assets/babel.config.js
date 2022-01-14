module.exports = (api) => {
  api.cache(true)
  return {
    presets: [
      [
        "@babel/preset-env",
        {
          modules: "auto",
          useBuiltIns: "entry",
          corejs: {
            version: 3,
          },
          targets: "defaults"
        },
      ],
      "@babel/preset-react",
    ],
    sourceType: "unambiguous",
  }
}
