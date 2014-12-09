FactoryGirl.define do
  factory :trip do
    sequence(:code) { |n| '%02d' % n }
    sequence(:name) { |n| 'Trip %02d' % n }
  end
end
