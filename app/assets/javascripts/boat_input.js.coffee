formatBoatItem = (boat)->
  """
  <div class="pull-right" style="margin-top: -1px">
    <span class="label label-primary">#{boat.code}</span>
  </div>
  <i class="fa fa-anchor" />
  #{boat.name}
  """

$(document).on 'page:change', ->
  $('input[type=boat].autocomplete').select2
    minimumInputLength: 0
    allowClear: true

    initSelection: (element, callback)->
      if id = element.val()
        url = "/autocomplete/boats/#{id}"
        jQuery.getJSON url, callback

    formatResult: formatBoatItem
    formatSelection: formatBoatItem

    ajax:
      url: '/autocomplete/boats'
      quietMillis: 100

      data: (term)->
        { q: term }

      results: (data, page)->
        { results: data }
