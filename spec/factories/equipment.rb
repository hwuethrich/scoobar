FactoryGirl.define do
  factory :equipment do
    association :category, factory: :equipment_category, strategy: :build
    sequence(:name) { |n| 'Equipment %d' % n }
  end

end
