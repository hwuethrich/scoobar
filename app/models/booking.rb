class Booking < ActiveRecord::Base
  belongs_to :event
  belongs_to :customer, touch: true

  validates :event, presence: true
  validates :customer, presence: true
  validates :customer_id, uniqueness: { scope: :event_id }

  delegate :trip, to: :event

  scope :chronological, -> { joins{event}.merge(Event.chronological) }

  def date
    event.start_time.to_date
  end

end
