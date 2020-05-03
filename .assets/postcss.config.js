const postcssCssVariables = require("postcss-css-variables");
const postcssImport = require("postcss-import");
const postcssPresetEnv = require("postcss-preset-env");
const postcssUrl = require("postcss-url");
const cssnano = require("cssnano");

function toKebabCase(str) {
  return str.replace(/([a-z])([A-Z0-9])/g, '$1-$2').toLowerCase()
}

/**
 * Collect values of variables from a nested object definition (like the Kaizen tokens)
 * @param {Object|String|Number} maybeNode Either a node within the tree of variables or the final value of a branch
 * @param {Array} pathKeys Array of keys to reach a path
 * @param {Array} collected Array of collected values as ["--variable-name", "value"] tuples
 */
function collectValues(maybeNode, pathKeys, collected = []) {
  if (typeof maybeNode === "string" || typeof maybeNode === "number") {
    collected = collected.push([pathKeys.join("-"), maybeNode]);
  } else {
    for (const key in maybeNode) {
      collectValues(maybeNode[key], pathKeys.concat([toKebabCase(key)]), collected);
    }
  }
  return collected;
}

module.exports = ({ env }) => ({
  plugins: [
    // Add module-like @import support to our CSS. This sets the context for all imports
    // to be the base entry point.
    postcssImport,
    // postcss-url "rebases" any `url()` references in CSS to their original relative
    // position on the filesystem (so that postcss-import doesn't break things)
    postcssUrl(),
    // Make variables available to CSS compilation
    // NOTE: This plugin expects all variables to be defined in either:
    // - The original CSS
    // - The `variables` object we’re passing it
    // If things are missing from there they’ll be resolved as `undefined`
    postcssCssVariables({ variables: {} }),
    // Polyfill
    postcssPresetEnv({ stage: 1 }),
    env === "production"
      ? cssnano({
          preset: "default"
        })
      : false
  ]
});
