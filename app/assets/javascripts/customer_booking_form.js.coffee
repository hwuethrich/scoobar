$(document).on 'page:change', ->
  form = $('#customer-booking-form').find('form')

  form.find('.booking_event').on 'select2-selecting', (jsevent)->
    event = jsevent.choice

    price = form.find('.booking_price input')
    price.attr 'placeholder', event.price
    price.effect 'highlight'
    price.focus()
