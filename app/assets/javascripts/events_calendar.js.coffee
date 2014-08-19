$(document).on 'page:change', ->

  container = $('#events-calendar')

  eventUpdate = (event)->
    url = "/events/#{event.id}"

    data =
      start_time: event.start.toJSON()
      end_time:   event.end.toJSON()

    $.ajax "/events/#{event.id}",
      type: 'PATCH'
      dataType: 'json'
      data: { event: data }

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
    slotEventOverlap: true
    slotDuration: '00:30:00'
    snapDuration: '00:15:00'
    minTime: '06:00'
    maxTime: '20:00'

    events:
        url: '/events/calendar.json'

    eventDrop: eventUpdate
    eventResize: eventUpdate
