$(document).on 'page:change', ->
  form = $('#event-form')

  form.find('.event_trip').on 'select2-selecting', (event)->
    trip = event.choice
    input = form.find('.event_duration input')
    input.val trip.duration
    input.effect 'highlight'

  form.find('.event_boat').on 'select2-selecting', (event)->
    boat = event.choice
    input = form.find('.event_capacity input')
    input.val boat.capacity
    input.effect 'highlight'
