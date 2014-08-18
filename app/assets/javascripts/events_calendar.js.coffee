$(document).on 'page:change', ->

  container = $('#events-calendar')

  eventUpdate = (event)->
    url = "/events/#{event.id}"

    data =
      start_time: event.start.toJSON()
      end_time:   event.end.toJSON()

    $.ajax "/events/#{event.id}.json",
      type: 'PATCH'
      dataType: 'json'
      data: { event: data }

  container.fullCalendar
    header:
      left: 'prev,next today'
      center: 'title'
      right: 'agendaDay,agendaWeek,month'

    defaultView: 'agendaWeek'

    editable: true
    eventLimit: true
    selectable: true

    slotDuration: '00:30:00'
    snapDuration: '00:15:00'

    minTime: '06:00'
    maxTime: '20:00'

    events:
        url: '/events/calendar.json'

    eventDrop: eventUpdate
    eventResize: eventUpdate

    select: (start, end)->
      form = $('#event-quick-form')

      form.find('#event_start_time').data("DateTimePicker").setDate start

      duration = (end - start) / (60 * 1000)
      form.find('#event_duration').val duration

      form.find('#event_name').focus()

  quick_form = $('#event-quick-form form')
  quick_form.on 'ajax:success', ->
    container.fullCalendar 'refetchEvents'
    quick_form[0].reset()
    quick_form.find('#event_name').blur()
    container.fullCalendar 'unselect'
