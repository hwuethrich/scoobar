$ ->
  # Add numer of errors in each tab-pane to the corresponding tab
  $('form .tab-pane').each ->
    errors = $(this).find('.form-group.has-error').size()
    if errors > 0
      tab = $(document).find(".nav-tabs [href='##{this.id}']").addClass 'text-danger has-errors'
      tab.append " <span class='label label-danger'>#{errors}</span>"

    # Show first tab with errors
    $(document).find(".nav-tabs a.has-errors").first().tab 'show'
