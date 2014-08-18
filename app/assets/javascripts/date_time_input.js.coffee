$(document).on 'ready page:change', ->
  $('input[type=datetime]').datetimepicker
    useSeconds: false
    sideBySide: false
    icons:
        time: "fa fa-clock-o"
        date: "fa fa-calendar"
        up: "fa fa-arrow-up"
        down: "fa fa-arrow-down"

  $('input.datetime').on 'dp.change', (event)->
    hidden = $(event.target).next 'input[type=hidden]'
    hidden.val event.date.format 'YYYY-MM-DDTHH:mm'
