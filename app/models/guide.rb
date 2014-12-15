class Guide < ActiveRecord::Base

  # VALIDATIONS

  validates :name, presence: true

  # SCOPES

  scope :alphabetical, -> { order :name }

  # ASSOCIATIONS

  has_many :events, dependent: :nullify

end
