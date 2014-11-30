class Equipment < ActiveRecord::Base

  # ASSOCIATIONS

  belongs_to :category

  # VALIDATIONS

  validates :category, presence: true
  validates :name, presence: true, uniqueness: { scope: :category_id }

end
