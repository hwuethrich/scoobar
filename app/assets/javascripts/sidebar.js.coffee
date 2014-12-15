$(document).on 'page:change', ->
  $(".sidebar .treeview").tree()

  $("[data-toggle='offcanvas']").click (e)->
    e.preventDefault()

    if $(window).width() <= 992
      $('.row-offcanvas').toggleClass('active')
      $('.left-side').removeClass("collapse-left")
      $(".right-side").removeClass("strech")
      $('.row-offcanvas').toggleClass("relative")
    else
      $('.left-side').toggleClass("collapse-left")
      $(".right-side").toggleClass("strech")
