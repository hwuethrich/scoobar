# Read locale from html tag
lang = $('html').attr('lang')

# Set locale for moment
moment.locale lang

# I18n.js
I18n.defaultLocale = 'en'
I18n.locale = lang
