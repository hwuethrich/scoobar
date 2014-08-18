class DateTimeInput < SimpleForm::Inputs::StringInput

  def input(wrapper_options = nil)
    format = input_html_options.delete('format') { :default }

    # Hidden field options
    hidden_html_options = input_html_options.dup
    hidden_html_options[:id] = "#{attribute_name}_hidden"

    # Text field options
    value = object.send @attribute_name if object
    input_html_options[:value] = I18n.localize(value, format: '%m/%d/%Y %I:%M %p') if value
    input_html_options['data-date-format'] = 'MM/DD/YYYY hh:mm A'

    # Render fields
    text_field   = super
    hidden_field = @builder.hidden_field(attribute_name, hidden_html_options.to_hash)

    "#{text_field}\n#{hidden_field}\n".html_safe
  end
end
