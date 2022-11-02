/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ['./app/**/*.{js,ts,jsx,tsx}', './components/**/*.{js,ts,jsx,tsx}', './widgets/**/*.{js,ts,jsx,tsx}'],
  darkMode: 'class',
  theme: {
    extend: {
      colors: {
        primary: '#4CA9FF',
        secondary: '#BCD7FF',
        success: '#BCD7FF',
        warning: '#BCD7FF',
        error: '#BCD7FF',
        neutral: '#F3F4F6',
        white: '#FAFAFA',
        black: '#1C1F21',
      },
    },
  },
  plugins: [],
};
