FactoryGirl.define do
  factory :event do
    association :trip, strategy: :build

    start_time { (-10 + rand(20)).days.from_now.to_date + 8.hours + (rand(4) * 2).hours }
    duration { 30 + 15 * rand(6) }
  end
end
