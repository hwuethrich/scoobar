require 'rails_helper'

RSpec.feature 'Logbook:', type: :feature do

  let(:event) { create :event, start_time: '01/01/2014 10:00' }

  scenario 'Enter details for logbook after event' do

    visit edit_event_path(event)
    click_on 'Logbook'

    expect(page.current_path).to eq event_logbook_path(event)

    expect(find_field('Time in').value).to eq '10:00 AM'

    fill_in 'Max depth', with: '12.5'
    fill_in 'Time in', with: '11:00 AM'
    fill_in 'Dive time', with: '55'
    fill_in 'Comments', with: 'Whaleshark!'

    click_on 'Create Logbook'

    expect(event.logbook.max_depth).to eq(12.5)
    expect(event.logbook.time_in).to eq(DateTime.parse('01/01/2014 11:00'))
    expect(event.logbook.dive_time).to eq(55)

  end

end
