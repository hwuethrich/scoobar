$(document).on 'page:change ready', ->
  planner = $('#events-planner')

  trips = planner.find('.draggable')

  trips.draggable
    revert: true
    revertDuration: 0

  planner.find('.trip-filter').keyup (event)->
    query = $(event.target).val().toLowerCase()

    match = ->
      $(this).text().toLowerCase().indexOf(query) > -1

    trips.hide().filter(match).show()


