$(document).on 'page:change', ->
  switcher = $('.date-switcher')
  switcher.datetimepicker
    pickTime: false
  switcher.on 'dp.change', (event)->
    url = document.location.pathname + '?date=' + event.date.format('YYYY-MM-DD')
    document.location.href = url
