$(document).on 'ready page:change', ->
  $('input[type=datetime]').prop('type','text').datetimepicker
    useSeconds: false
    sideBySide: false

  $('input[type=date]').prop('type','text').datetimepicker
    pickTime: false

  $('input[type=time]').prop('type','text').datetimepicker
    pickDate: false

  handleChange = (format)->
    (event)->
      hidden = $(event.target).next 'input[type=hidden]'
      hidden.val event.date.format format

  handleEmpty = (event)->
    hidden = $(event.target).next 'input[type=hidden]'
    hidden.val '' if event.target.value == ''

  $('input.datetime')
    .on 'dp.change', handleChange('YYYY-MM-DDTHH:mm')
    .on 'change', handleEmpty

  $('input.date')
    .on 'dp.change', handleChange('YYYY-MM-DD')
    .on 'change', handleEmpty

  $('input.time')
    .on 'dp.change', handleChange('YYYY-MM-DDTHH:mm')
    .on 'change', handleEmpty
