module PlaceholderHelper

  def collection_placeholder(collection, message: nil, &block)
    if collection.any?
      capture_haml &block
    else
      render 'common/placeholder', message: message
    end
  end

  def placeholder(string=nil)
    if string.blank?
      content_tag :span, '&ndash;'.html_safe, class: 'text-muted'
    else
      string
    end
  end
end
