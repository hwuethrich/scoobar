$(document).on 'page:change ready', ->
  $('.certification input').select2
    allowClear: true

    createSearchChoice: (term)->
      { id: term, text: term }

    initSelection: (element, callback)->
      callback { id: element.val(), text: element.val() }

    ajax:
      url: '/autocomplete/certifications'
      quietMillis: 100

      data: (term)->
        { q: term }

      results: (data, page)->
        results = data.map (c)-> { id: c, text: c }
        { results: results }

