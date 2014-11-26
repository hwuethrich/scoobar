FactoryGirl.define do
  factory :booking do
    association :event, strategy: :build
    association :customer, strategy: :build
  end
end
