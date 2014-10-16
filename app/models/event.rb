class Event < ActiveRecord::Base

  include TruncateSeconds

  DEFAULT_COLOR = '#999'

  # ASSOCIATIONS

  belongs_to :trip

  has_many :bookings
  has_many :customers, through: :bookings

  # SCOPES

  scope :chronological, -> { order :start_time, :end_time }

  scope :starts_before, ->(time) { where { start_time < time }}
  scope :starts_after,  ->(time) { where { start_time >= time }}
  scope :ends_before,   ->(time) { where { end_time <= time }}
  scope :ends_after,    ->(time) { where { end_time > time }}

  scope :intersects, ->(t1, t2) { ends_after(t1).starts_before(t2) }

  scope :starts_between, ->(t1, t2) { starts_after(t1).starts_before(t2) }
  scope :starts_in_morning_of, ->(date) { starts_between(date.beginning_of_day, date.midday) }
  scope :starts_in_afternoon_of, ->(date) { starts_between(date.midday, date.end_of_day) }

  # VALIDATIONS

  validates :start_time, date: true, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }

  # DELEGATES

  delegate :code, to: :trip, prefix: true, allow_nil: true

  # MISC

  truncate_seconds_from :start_time, :end_time

  def name
    name? ? super : trip.try(:name)
  end

  def duration
    ((end_time - start_time) / 60).to_i if start_time.present? && end_time.present?
  end

  def duration=(min)
    self.end_time = start_time + min.to_i.minutes if start_time.present?
  end

  def current?
    start_time <= DateTime.current && DateTime.current <= end_time
  end

  def past?
    end_time.past?
  end

  def color
    trip.try(:color) || DEFAULT_COLOR
  end

  def capacity
    6
  end

  def number_of_bookings
    bookings.count
  end

  def fully_booked?
    number_of_bookings >= capacity
  end

  def to_s
    '%s - %s' % [I18n.l(start_time, format: :short), name]
  end

end
