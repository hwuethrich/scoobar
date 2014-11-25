module TimeRange
  extend ActiveSupport::Concern

  def duration
    ((end_time.to_i - start_time.to_i) / 60).to_i if start_time.present? && end_time.present?
  end

  def duration=(min)
    self.end_time = start_time + min.to_i.minutes if start_time.present?
  end

  def future?
    start_time.future?
  end

  def current?
    start_time <= DateTime.current && DateTime.current <= end_time
  end

  def past?
    end_time.past?
  end

  def starts_in_morning?
    (0..11).include? start_time.hour
  end

  def starts_in_afternoon?
    (12..23).include? start_time.hour
  end

end
