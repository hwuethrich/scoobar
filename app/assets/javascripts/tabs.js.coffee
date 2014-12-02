$(document).on 'ready page:change', ->
  $("ul.nav-tabs > li > a").on "shown.bs.tab", (e)->
    id = $(e.target).attr("href").substr(1)
    window.location.hash = id;

  hash = window.location.hash;

  $('.tab-content .tab-pane').removeClass 'fade'
  $('ul.nav-tabs a[href="' + hash + '"]').tab('show');
  $('.tab-content .tab-pane').addClass('fade')
  $('.tab-content .tab-pane.active').addClass('in')
