$(document).on 'ready page:change', ->
  $('input[type=datetime]').prop('type','text').datetimepicker
    useSeconds: false
    sideBySide: false

  $('input[type=date]').prop('type','text').datetimepicker
    pickTime: false

  $('input.datetime').on 'dp.change', (event)->
    hidden = $(event.target).next 'input[type=hidden]'
    hidden.val event.date.format 'YYYY-MM-DDTHH:mm'

  $('input.date').on 'dp.change', (event)->
    hidden = $(event.target).next 'input[type=hidden]'
    hidden.val event.date.format 'YYYY-MM-DD'
