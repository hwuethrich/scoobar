class Event < ActiveRecord::Base

  include TimeRange

  DEFAULT_COLOR = '#999'

  # ASSOCIATIONS

  belongs_to :trip
  belongs_to :boat

  has_many :bookings, counter_cache: true
  has_many :customers, through: :bookings

  # SCOPES

  scope :chronological, -> { order :start_time, :end_time }

  scope :starts_before, ->(time) { where { start_time < time }}
  scope :ends_after, ->(time) { where { end_time > time }}
  scope :intersects, ->(t1, t2) { ends_after(t1).starts_before(t2) }
  scope :boat_dives, -> { where { boat_id != nil }}
  scope :night_dives, -> { where { night_dive == true }}

  # VALIDATIONS

  validates :start_time, date: true, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }
  validates :capacity, numericality: { greater_than: 0, allow_nil: true }

  # DELEGATES

  delegate :code, to: :trip, prefix: true, allow_nil: true
  delegate :code, :capacity, to: :boat, prefix: true, allow_nil: true

  def name
    name? ? name : trip.try(:name)
  end

  def color
    trip.try(:color) || DEFAULT_COLOR
  end

  def capacity
    super || boat_capacity
  end

  def number_of_bookings
    bookings.size
  end

  def limited_capacity?
    capacity.present?
  end

  def fully_booked?
    limited_capacity? && number_of_bookings >= capacity
  end

  def boat_dive?
    boat.present?
  end

  def to_s
    '%s - %s' % [I18n.l(start_time, format: :short), name]
  end

end
