class Event::Logbook < ActiveRecord::Base
  belongs_to :event

  validates :max_depth, presence: true
  validates :time_in,   presence: true
  validates :dive_time, presence: true

  def time_out
    time_in + dive_time.minutes if time_in.present?
  end

  def formatted_time_in
    formatted_time time_in
  end

  def formatted_time_out
    formatted_time time_out
  end

  private

  def formatted_time(time, format: '%H:%M')
    time.strftime(format) if time.present?
  end

end
