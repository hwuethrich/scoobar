$(document).on 'ajax:success', '#customers-search', (event, table)->
  $('#customers-results').html table
