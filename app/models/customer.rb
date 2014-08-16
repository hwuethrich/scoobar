class Customer < ActiveRecord::Base

  enum gender: [ :male, :female ]

  validates :first_name, :last_name, :date_of_birth, :gender, presence: true
  validates :email, presence: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates_date :date_of_birth, on_or_before: :today

  validates_date :certification_date, :last_dive_on, on_or_before: :today
  validates :number_of_dives, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  scope :alphabetical, -> { order :last_name, :first_name }

  def full_name
    [first_name, last_name].join ' '
  end

  def age
    Date.today.year - date_of_birth.year if date_of_birth.present?
  end

end
