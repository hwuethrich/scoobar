$(document).on 'page:change', ->

  container = $('#events-calendar')

  eventUpdate = (event)->
    data =
      start_time: event.start.toISOString()
      end_time:   event.end.toISOString()

    $.ajax "/events/#{event.id}",
      type: 'PATCH'
      dataType: 'json'
      data: { event: data }

  eventCreate = (event)->
    $.ajax "/events",
      type: 'POST'
      dataType: 'json'
      data: { event: event }

      success: (event)->
        container.fullCalendar 'refetchEvents'

  container.fullCalendar
    header:
      left: 'prev,next today'
      center: 'title'
      right: 'agendaDay,agendaWeek,month'

    defaultView: 'agendaWeek'
    eventLimit: true

    editable: true
    selectable: false

    # Agenda options
    allDaySlot: false
    slotEventOverlap: false
    slotDuration: '00:30:00'
    snapDuration: '00:15:00'
    minTime: '06:00'
    maxTime: '20:00'

    # Droppable
    droppable: true

    events:
      url: '/events/calendar.json'

    eventDrop: eventUpdate
    eventResize: eventUpdate

    eventRender: (event, element)->
      element.bind 'dblclick', ->
        window.location.href = "/events/#{event.id}/edit"

    drop: (date, event) ->
      el = $(event.target)

      trip_id    = el.data('tripId')
      start_time = date.toISOString()
      duration   = moment.duration(el.data('duration')).asMinutes()

      event =
        trip_id: trip_id
        start_time: start_time
        duration: duration

      eventCreate event

