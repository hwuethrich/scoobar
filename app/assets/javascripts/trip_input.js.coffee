formatTripItem = (trip)->
  """
  <span class="label label-default" style="background-color: #{trip.color};">#{trip.code}</span> #{trip.name}
  """

$(document).on 'page:change', ->
  $('input[type=trip].autocomplete').select2
    minimumInputLength: 0

    initSelection: (element, callback)->
      if id = element.val()
        url = "/autocomplete/trips/#{id}"
        jQuery.getJSON url, callback

    formatResult: formatTripItem
    formatSelection: formatTripItem

    ajax:
      url: '/autocomplete/trips'
      quietMillis: 100

      data: (term)->
        { q: term }

      results: (data, page)->
        { results: data }
