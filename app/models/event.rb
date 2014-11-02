class Event < ActiveRecord::Base

  include TimeRange

  DEFAULT_COLOR = '#999'

  # ASSOCIATIONS

  belongs_to :trip

  has_many :bookings, counter_cache: true
  has_many :customers, through: :bookings

  # SCOPES

  scope :chronological, -> { order :start_time, :end_time }

  scope :starts_before, ->(time) { where { start_time < time }}
  scope :ends_after, ->(time) { where { end_time > time }}
  scope :intersects, ->(t1, t2) { ends_after(t1).starts_before(t2) }

  # VALIDATIONS

  validates :start_time, date: true, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }

  # DELEGATES

  delegate :code, to: :trip, prefix: true, allow_nil: true

  def name
    name? ? super : trip.try(:name)
  end

  def color
    trip.try(:color) || DEFAULT_COLOR
  end

  def capacity
    6
  end

  def number_of_bookings
    bookings.size
  end

  def fully_booked?
    number_of_bookings >= capacity
  end

  def to_s
    '%s - %s' % [I18n.l(start_time, format: :short), name]
  end

end
