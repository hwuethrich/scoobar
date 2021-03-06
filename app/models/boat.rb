class Boat < ActiveRecord::Base

  scope :alphabetical, -> { order :name }
  scope :search, ->(query) { where { (code =~ ('%s%' % query)) | (name =~ ('%s%' % query))} }

  validates :code, presence: true, length: { maximum: 3 }, uniqueness: true
  validates :name, presence: true
  validates :capacity, numericality: { greater_than: 0, allow_nil: true }

end
