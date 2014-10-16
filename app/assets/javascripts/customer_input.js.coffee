formatCustomerItem = (customer)->
  """
  <img src="#{customer.portrait_url}" width="20px"></img>
  #{customer.full_name}
  """

$(document).on 'page:change', ->
  $('input.autocomplete').select2
    minimumInputLength: 1

    initSelection: (element, callback)->
      if id = element.val()
        url = "/autocomplete/customers/#{id}"
        jQuery.getJSON url, callback

    formatResult: formatCustomerItem
    formatSelection: formatCustomerItem

    ajax:
      url: '/autocomplete/customers'
      quietMillis: 100

      data: (term)->
        { q: term }

      results: (data, page)->
        { results: data }
