class Boat < ActiveRecord::Base

  scope :alphabetical, -> { order :name }

  validates :code, presence: true, length: { maximum: 3 }, uniqueness: true
  validates :name, presence: true

end
