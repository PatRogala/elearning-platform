const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
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
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/aspect-ratio'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
    require('daisyui')
  ],
}
