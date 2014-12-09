class TripInput < AutocompleteInput

  def input(wrapper_options = nil)
    input_html_options[:placeholder] ||= 'Select Trip'
    super
  end

end
