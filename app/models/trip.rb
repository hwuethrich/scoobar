class Trip < ActiveRecord::Base

  scope :alphabetical, -> { order :name }
  scope :search, ->(query) { where { (code =~ ('%s%' % query)) | (name =~ ('%s%' % query))} }

  validates :code, presence: true, length: { maximum: 3 }, uniqueness: true
  validates :name, presence: true
  validates :duration, numericality: { greater_than: 0, allow_nil: true }
  validates :price, numericality: { greater_than_or_equal_to: 0, allow_nil: true }

  def to_s
    name
  end

end
