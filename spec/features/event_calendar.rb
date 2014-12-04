require 'rails_helper'

RSpec.feature 'Event calendar:', type: :feature do

  scenario 'Double-click on calendar event to edit event', js: true do
    event = create :event, start_time: Date.today.midday

    visit events_calendar_path
    find('.fc-event').double_click

    expect(page.current_path).to eq edit_event_path(event)
  end

end
