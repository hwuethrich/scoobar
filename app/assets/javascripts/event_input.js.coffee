formatEventItem = (icon, format)->
  (event)->
    trip = event.trip
    start_time = moment(event.start_time).format(format)

    """
    <div class="pull-right" style="margin-top: -1px">
      <small><i class="fa fa-#{icon}"></i> #{start_time}</small>
    </div>
    <span class="label label-default" style="background-color: #{trip.color};">#{trip.code}</span> #{event.name}
    """

formatEventGroup = (results)->
  """
  <i class="fa fa-calendar"></i> #{results.text}
  """

$(document).on 'page:change', ->
  $('input[type=event].autocomplete').select2
    minimumInputLength: 0
    allowClear: true

    initSelection: (element, callback)->
      if id = element.val()
        url = "/autocomplete/events/#{id}"
        jQuery.getJSON url, callback

    formatResult: (result)->
      if result.children
        formatter = formatEventGroup
      else
        formatter = formatEventItem('clock-o', 'hh:mm A')

      formatter(result)

    formatSelection: formatEventItem('calendar', 'DD/MM hh:mm A')

    ajax:
      url: '/autocomplete/events'
      quietMillis: 100

      data: (term, page)->
        { q: term, page: page }

      results: (data, page)->
        data
