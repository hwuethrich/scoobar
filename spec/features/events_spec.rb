require 'rails_helper'

RSpec.feature 'Events:', type: :feature do

  scenario 'Plan a new event' do

    trip = create :trip, code: 'PI', name: 'Pescador Island'
    guide = create :guide, name: 'John Doe'

    visit root_path
    click_on 'Events'
    click_on 'Create Event'

    fill_in 'Trip', with: trip.id
    select 'John Doe', from: 'Guide'

    click_on 'Create Event'

    event = Event.last
    expect(event.guide).to eq guide
    expect(event.trip).to eq trip
  end

  describe 'Calendar:' do
    scenario 'Double-click on calendar event to edit event', js: true do
      event = create :event, start_time: Date.today.midday

      visit events_calendar_path
      find('.fc-event').double_click

      expect(page.current_path).to eq edit_event_path(event)
    end
  end

end
