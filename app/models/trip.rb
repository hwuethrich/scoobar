class Trip < ActiveRecord::Base

  scope :alphabetical, -> { order :name }

  validates :code, presence: true, length: { maximum: 3 }, uniqueness: true
  validates :name, presence: true
  validates :duration, numericality: { greater_than: 0, allow_nil: true }

end
