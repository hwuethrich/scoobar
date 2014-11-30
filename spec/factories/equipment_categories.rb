FactoryGirl.define do

  factory :equipment_category, class: Equipment::Category do
    sequence(:name) { |n| 'Equipment %d' % n }
  end

end
