class ColorPickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    input_html_options[:rel] = 'colorpicker'
    super
  end
end
