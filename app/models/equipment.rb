class Equipment < ActiveRecord::Base

  # ASSOCIATIONS

  belongs_to :category
  has_many :rentals, dependent: :destroy

  # SCOPES

  scope :alphabetical, -> { order :name }

  # VALIDATIONS

  validates :category, presence: true
  validates :name, presence: true, uniqueness: { scope: :category_id }

end
