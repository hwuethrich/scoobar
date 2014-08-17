class Customer < ActiveRecord::Base

  enum gender: [ :male, :female ]

  validates :first_name, :last_name, :gender, presence: true
  validates :email, presence: true, format: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  validates :date_of_birth, presence: true, date: { on_or_before: -> { Date.today } }


  validates :certification_date, :last_dive_on, date: { before_or_equal_to: Proc.new { Date.today }}, allow_nil: true
  validates :number_of_dives, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  scope :alphabetical, -> { order :last_name, :first_name }

  def full_name
    [first_name, last_name].join ' '
  end

  def age
    Date.today.year - date_of_birth.year if date_of_birth.present?
  end

end
