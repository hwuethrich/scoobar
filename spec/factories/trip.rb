FactoryGirl.define do
  factory :trip do
    sequence(:code) { |n| 'T%d' % n }
    sequence(:name) { |n| 'Trip %d' % n }
  end
end
