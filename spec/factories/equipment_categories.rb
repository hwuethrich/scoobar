FactoryGirl.define do

  factory :equipment_category, class: Equipment::Category do
    sequence(:name) { |n| 'Category %d' % n }
  end

end
