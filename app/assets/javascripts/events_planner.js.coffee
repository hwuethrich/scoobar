$(document).on 'page:change', ->
  $('#events-planner .draggable').draggable
    revert: true
    revertDuration: 0
