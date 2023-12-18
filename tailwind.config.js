const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  darkMode: 'class',
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}',
    './node_modules/preline/preline.js',
  ],
  theme: {
    extend: {
      fontFamily: {
        Poppins: ['Poppins', ...defaultTheme.fontFamily.sans],
        Josefin: ['Josefin Sans', ...defaultTheme.fontFamily.sans],
      },
      colors: {
        'text': 'rgb(240, 240, 240)',
        'background': 'rgb(0, 0, 0)',
        'primary': 'rgb(169, 234, 196)',
        'secondary': 'rgb(27, 39, 32)',
        'accent': 'rgb(255, 61, 64)',
        'text-dark': 'rgb(15, 15, 15)',
        'background-dark': 'rgb(255, 255, 255)',
        'primary-dark': 'rgb(21, 86, 48)',
        'secondary-dark': 'rgb(216, 228, 221)',
        'accent-dark': 'rgb(194, 0, 3)',
      }
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('preline/plugin')
  ],
}
