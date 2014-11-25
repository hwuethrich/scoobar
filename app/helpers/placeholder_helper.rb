module PlaceholderHelper

  def collection_placeholder(collection, message: nil, &block)
    if collection.any?
      capture_haml &block
    else
      render 'common/placeholder', message: message
    end
  end

end
