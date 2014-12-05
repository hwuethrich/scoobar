class Event::Logbook < ActiveRecord::Base
  belongs_to :event

  validates :max_depth, presence: true
  validates :time_in,   presence: true
  validates :dive_time, presence: true

end
