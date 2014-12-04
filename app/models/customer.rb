class Customer < ActiveRecord::Base

  enum gender: [ :male, :female ]

  validates :first_name, :last_name, :gender, presence: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, allow_blank: true }
  validates :date_of_birth, presence: true, timeliness: { on_or_before: :today, type: :date }

  validates :certification_date, :last_dive_on, timeliness: { on_or_before: :today, type: :date }, allow_nil: true
  validates :number_of_dives, numericality: { greater_than_or_equal_to: 0 }, allow_nil: true

  scope :alphabetical, -> { order :last_name, :first_name }
  scope :search, ->(query) { where { (first_name =~ ('%s%' % query)) | (last_name =~ ('%s%' % query))} }

  has_many :bookings, dependent: :destroy
  has_many :rentals, dependent: :destroy

  def full_name
    [last_name, first_name].join ', '
  end

  def age
    now = Time.now.utc.to_date
    dob = self.date_of_birth
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

  def to_s
    full_name
  end

end
