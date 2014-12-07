FactoryGirl.define do

  factory :rental do
    association :customer, strategy: :build
    association :equipment, strategy: :build

    start_time { DateTime.current }
  end

end
