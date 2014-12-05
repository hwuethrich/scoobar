class DateTimeInput < SimpleForm::Inputs::StringInput
  def input(wrapper_options = nil)
    # format = input_html_options.delete('format') { :default }
    value = object.send @attribute_name if object

    # Hidden field options
    hidden_html_options = input_html_options.dup
    hidden_html_options[:id] = "#{attribute_name}_hidden"
    hidden_html_options[:value] = I18n.localize(value, format: '%Y-%m-%dT%H:%M') if value

    # Text field options
    input_html_options[:value] = I18n.localize(value, format: value_format) if value
    input_html_options['data-date-format'] = js_format

    # Render fields
    text_field   = super
    hidden_field = @builder.hidden_field(attribute_name, hidden_html_options.to_hash)

    "#{text_field}\n#{hidden_field}\n".html_safe
  end

  private

  def value_format
    case input_type
    when :date     then '%m/%d/%Y'
    when :datetime then '%m/%d/%Y %I:%M %p'
    when :time     then '%I:%M %p'
    end
  end

  def js_format
    case input_type
    when :date     then 'MM/DD/YYYY'
    when :datetime then 'MM/DD/YYYY hh:mm A'
    when :time     then 'hh:mm A'
    end
  end

end
