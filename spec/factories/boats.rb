FactoryGirl.define do
  factory :boat do
    sequence(:code) { |n| 'B%d' % n }
    sequence(:name) { |n| 'Boat %d' % n }
  end
end
