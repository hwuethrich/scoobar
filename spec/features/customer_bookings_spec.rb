require 'rails_helper'

RSpec.feature 'Customer Bookings:', type: :feature do

  let(:customer) { create :customer }

  let(:events) {[
    create(:event, start_time: '01/10/2014 10:00', trip: build(:trip, code: 'T1', name: 'Trip 1')),
    create(:event, start_time: '01/10/2014 12:00', trip: build(:trip, code: 'T2', name: 'Trip 2'))
  ]}

  context 'Existing bookings:' do

    before(:each) do
      events.each do |event|
        create :booking, customer: customer, event: event
      end
    end

    scenario 'List bookings for customer' do
      visit customer_path(customer)

      click_on 'Bookings'

      expected_bookings = [
        { start_time: '01 Oct 10:00', trip_code: 'T1', trip_name: 'Trip 1'},
        { start_time: '01 Oct 12:00', trip_code: 'T2', trip_name: 'Trip 2'}
      ]

      expect(listed_bookings(page)).to eq expected_bookings
    end
  end

  scenario 'Add new booking' do

    visit customer_bookings_path(customer)

    expect(page).to have_content 'This customer has no bookings yet'

    within('.new_booking') do
      fill_in 'Event', with: events[0].id
      click_on 'Create Booking'
    end

    within('.new_booking') do
      fill_in 'Event', with: events[1].id
      click_on 'Create Booking'
    end

    expected_bookings = [
      { start_time: '01 Oct 10:00', trip_code: 'T1', trip_name: 'Trip 1'},
      { start_time: '01 Oct 12:00', trip_code: 'T2', trip_name: 'Trip 2'}
    ]

    expect(listed_bookings(page)).to eq expected_bookings

  end

  def listed_bookings(page)
    page.all('table tbody tr').map do |row|
      {
        start_time: row.find('td[1]').text,
        trip_code:  row.find('.trip-code').text,
        trip_name:  row.find('.trip-name').text
      }
    end
  end

end
