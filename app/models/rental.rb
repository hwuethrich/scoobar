class Rental < ActiveRecord::Base

  include TimeRange::Validations
  include TimeRange::Scopes

  # ASSOCIATION

  belongs_to :customer
  belongs_to :equipment

  # VALIDATIONS

  validates :customer, presence: true
  validates :equipment, presence: true
  validates :start_time, presence: true

  def returned?
    end_time.present?
  end

  def returned_at(time = nil)
    self.end_time = time
  end
end
