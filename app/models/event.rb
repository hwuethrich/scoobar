class Event < ActiveRecord::Base

  include TruncateSeconds

  scope :chronological, -> { order :start_time, :end_time }

  scope :before, ->(time) { where { start_time <= time }}
  scope :after,  ->(time) { where { end_time >= time }}
  scope :for_date, ->(date) { after(date.beginning_of_day).before(date.end_of_day) }
  scope :for_yesterday, -> { for_date(Date.yesterday) }
  scope :for_today, -> { for_date(Date.today) }
  scope :for_tomorrow, -> { for_date(Date.tomorrow) }

  validates :start_time, date: true, presence: true
  validates :duration, presence: true, numericality: { greater_than: 0 }

  truncate_seconds_from :start_time, :end_time

  def duration
    ((end_time - start_time) / 60).to_i if start_time.present? && end_time.present?
  end

  def duration=(min)
    self.end_time = start_time + min.to_i.minutes if start_time.present?
  end

end
