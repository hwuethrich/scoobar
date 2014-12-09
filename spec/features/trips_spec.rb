require 'rails_helper'

RSpec.feature 'Trips:', type: :feature do

  scenario 'Add trip' do
    visit root_path
    click_on 'Trips'

    expect(page).to have_content('No trips yet')

    click_on 'Add Trip'

    fill_in 'Code', with: 'PI'
    fill_in 'Name', with: 'Pescador Island'
    fill_in 'Price', with: '125.25'
    click_on 'Create Trip'

    expect(Trip.count).to eq 1

    trip = Trip.last
    expect(trip.name).to eq 'Pescador Island'
    expect(trip.code).to eq 'PI'
    expect(trip.price).to eq 125.25
    expect(page.current_path).to eq trips_path
  end

  scenario 'Edit trip' do
    trip = create(:trip, code: 'PI', name: 'Pescator Island')

    visit trips_path
    within('.table-trips') do
      click_on 'Pescator Island'
    end

    fill_in 'Name', with: 'Pescador Island'
    click_on 'Update Trip'

    within('.table-trips') do
      expect(page).to have_content 'Pescador Island'
    end
  end

  scenario 'Delete trip' do
    trip = create(:trip, name: 'Pescador Island')

    visit trips_path
    within('.table-trips') do
      find('.btn-delete').click()
    end

    expect(page).to have_content('No trips yet')
  end

end
