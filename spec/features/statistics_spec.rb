require 'rails_helper'

RSpec.feature 'Statistics:', type: :feature do

  before(:each) do
    Timecop.travel '5/4/2014 10:00'

    events = [
      create(:event, start_time: '1/1/2013 12:00'),
      create(:event, start_time: '5/4/2014 12:00'),
      create(:event, start_time: '6/4/2014 12:00')
    ]
  end

  scenario 'Show statistics for current year' do
    visit root_path
    click_on 'Statistics'
    expect(page.current_path).to eq statistics_path

    within '#events-count' do
      expect(page).to have_content '2'
    end
  end

  scenario 'Show statistics for previous year' do
    visit statistics_path
    click_on '2013'

    within '#events-count' do
      expect(page).to have_content '1'
    end
  end

end
