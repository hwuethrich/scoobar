class AutocompleteInput < SimpleForm::Inputs::StringInput

  def input(wrapper_options = nil)
    input_html_classes.push 'autocomplete'
    super
  end

end
