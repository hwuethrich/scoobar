$(document).on 'page:change', ->
  $("ul.nav-tabs > li > a").on "shown.bs.tab", (e)->
    id = $(e.target).attr("href").substr(1)
    window.location.hash = "tab:#{id}"

  if tab = window.location.hash.match(/^#tab:(.+)/)
    $('.tab-content .tab-pane').removeClass 'fade'
    $('ul.nav-tabs a[href="#' + tab[1] + '"]').tab('show');
    $('.tab-content .tab-pane').addClass('fade')
    $('.tab-content .tab-pane.active').addClass('in')
