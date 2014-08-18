module TruncateSeconds
  extend ActiveSupport::Concern

  included do
    class_attribute :truncate_seconds_attrs
    self.truncate_seconds_attrs = []
    before_validation :truncate_seconds_from_attrs
  end

  def truncate_seconds_from_attrs
    truncate_seconds_attrs.each do |attr|
      value = self[attr]
      self[attr] = value.change(sec: 0) if value.present?
    end
  end

  module ClassMethods
    def truncate_seconds_from(*attrs)
      self.truncate_seconds_attrs += attrs
    end
  end
end
