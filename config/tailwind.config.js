const defaultTheme = require("tailwindcss/defaultTheme");
const colors = require("tailwindcss/colors");

module.exports = {
  content: [
    "./app/helpers/**/*.rb",
    "./app/javascript/**/*.js",
    "./app/views/**/*",
  ],
  theme: {
    extend: {
      fontFamily: {
        sans: ["Inter var", ...defaultTheme.fontFamily.sans],
      },
      colors: {
        primary: colors.rose,
        secondary: colors.gray,
        danger: colors.red,
      },
    },
  },
  plugins: [
    require("@tailwindcss/forms"),
    require("@tailwindcss/aspect-ratio"),
    require("@tailwindcss/typography"),
  ],
  important: true,
};
