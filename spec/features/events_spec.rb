require 'rails_helper'

RSpec.feature 'Events:', type: :feature do

  scenario 'Plan a new event' do
    trip = create :trip, code: 'PI', name: 'Pescador Island'
    guide = create :guide, name: 'John Doe'

    visit root_path
    click_on 'Add Event'

    fill_in 'Trip', with: trip.id
    fill_in 'Duration', with: 60
    select 'John Doe', from: 'Guide'
    fill_in 'Price', with: 100.25

    click_on 'Create Event'

    expect(Event.count).to eq 1

    event = Event.last
    expect(event.guide).to eq guide
    expect(event.trip).to eq trip
    expect(event.price).to eq 100.25
  end

  describe 'Deleting events:' do

    let!(:event) { create :event, start_time: Date.tomorrow.midday }

    scenario 'Delete event from panel in list' do
      visit events_path(date: Date.tomorrow)

      within('.panel-event') do
        click_on 'Delete'
      end

      expect(Event.count).to be_zero
      expect(page.current_url).to eq events_url(date: Date.tomorrow)
    end

    scenario 'Delete event from event form' do
      visit edit_event_path(event)

      within('.form-actions') do
        click_on 'Delete'
      end

      expect(Event.count).to be_zero
      expect(page.current_url).to eq events_url(date: Date.tomorrow)
    end
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
