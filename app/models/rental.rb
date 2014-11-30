class Rental < ActiveRecord::Base

  # ASSOCIATION

  belongs_to :customer
  belongs_to :equipment

  # VALIDATIONS

  validates :customer, presence: true
  validates :equipment, presence: true

end
