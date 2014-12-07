FactoryGirl.define do
  factory :customer do
    first_name    { Faker::Name.first_name }
    last_name     { Faker::Name.last_name }
    date_of_birth { Date.today - (10.years + rand(365 * 70).days) }
    gender        { ['male', 'female'].sample }
  end
end
