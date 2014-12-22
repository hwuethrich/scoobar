class ColorPickerInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    template.capture_haml do
      template.haml_tag :span, class: 'input-group', rel: 'colorpicker' do
        template.haml_tag :span, class: 'input-group-addon' do
          template.haml_tag :i
        end
        template.haml_concat super
      end
    end
  end
end
