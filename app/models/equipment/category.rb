class Equipment::Category < ActiveRecord::Base

 # SCOPES

 scope :alphabetical, -> { order :name }

 # VALIDATIONS

 validates :name, uniqueness: true, presence: true

end
