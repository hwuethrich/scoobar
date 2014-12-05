FactoryGirl.define do
  factory :event_logbook, class: 'Event::Logbook' do
    association :event

    time_in { event.start_time }
    dive_time 60
    max_depth 18.0
  end

end
