class Equipment::Category < ActiveRecord::Base

  # ASSOCIATIONS

  has_many :equipment

  # SCOPES

  scope :alphabetical, -> { order :name }

  # VALIDATIONS

  validates :name, uniqueness: true, presence: true

end
