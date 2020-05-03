module.exports = function eslintConfig(mode) {
  if (mode === "development") {
    return {
      extends: "react-app",
      plugins: ["prettier"],
      rules: {
        "prettier/prettier": "error"
      }
    };
  } else {
    return {
      extends: "react-app",
      rules: {
        "no-debugger": "error"
      }
    };
  }
};
