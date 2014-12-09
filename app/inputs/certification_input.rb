class CertificationInput < AutocompleteInput

  def input(wrapper_options = nil)
    input_html_options[:placeholder] ||= 'Select Certification'
    super
  end

end
