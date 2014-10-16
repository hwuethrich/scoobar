class Booking < ActiveRecord::Base
  belongs_to :event
  belongs_to :customer

  validates :event, presence: true
  validates :customer, presence: true
end
