class BoatInput < AutocompleteInput

  def input(wrapper_options = nil)
    input_html_options[:placeholder] ||= 'Select Boat'
    super
  end

end
