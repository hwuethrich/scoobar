class Booking < ActiveRecord::Base
  belongs_to :event
  belongs_to :customer, touch: true

  validates :event, presence: true
  validates :event_id, uniqueness: { scope: :customer_id }

  validates :customer, presence: true
  validates :customer_id, uniqueness: { scope: :event_id }

  delegate :trip,  to: :event, allow_nil: true
  delegate :price, to: :event, allow_nil: true, prefix: true

  scope :chronological, -> { joins{event}.merge(Event.chronological) }

  def date
    event.start_time.to_date
  end

  def price
    super.present? ? super : event_price
  end

end
