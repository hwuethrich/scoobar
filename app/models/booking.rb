class Booking < ActiveRecord::Base
  belongs_to :event
  belongs_to :customer

  validates :event, presence: true
  validates :customer, presence: true

  delegate :trip, to: :event

  def date
    event.start_time.to_date
  end

end
