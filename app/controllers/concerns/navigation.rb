module Navigation
  extend ActiveSupport::Concern

  included do
    class_attribute :_navbar_item
    helper_method :navbar_item_state
  end

  def active_navbar_item
    self.class._navbar_item
  end

  def navbar_item_state(item)
    active_navbar_item == item ? 'active' : nil
  end

  module ClassMethods
    def active_navbar_item(item)
      self._navbar_item = item
    end
  end

end
