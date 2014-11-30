FactoryGirl.define do

  factory :rental do
    association :customer, strategy: :build
    association :equipment, strategy: :build
  end

end
