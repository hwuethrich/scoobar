class Event < ActiveRecord::Base

  include TimeRange::Validations
  include TimeRange::Scopes

  DEFAULT_COLOR = '#999'

  # ASSOCIATIONS

  belongs_to :trip
  belongs_to :boat
  belongs_to :guide
  has_one :logbook

  has_many :bookings, counter_cache: true
  has_many :customers, through: :bookings

  # SCOPES

  scope :boat_dives, -> { where { boat_id != nil }}
  scope :night_dives, -> { where { night_dive == true }}
  scope :guided_dives, -> { where { guide_id != nil }}

  # VALIDATIONS

  validates :start_time, presence: true
  validates :capacity, numericality: { greater_than: 0 }, allow_nil: true

  # DELEGATES

  delegate :code, to: :trip, prefix: true, allow_nil: true
  delegate :code, :capacity, to: :boat, prefix: true, allow_nil: true

  def name
    name? ? super : trip.try(:name)
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

  def guided_dive?
    guide.present?
  end

  def to_s
    '%s - %s' % [I18n.l(start_time, format: :short), name]
  end

end
