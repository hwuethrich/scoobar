require 'rails_helper'

RSpec.feature 'Customers:', type: :feature do

  scenario 'Register a new customer', js: true do
    visit root_path
    click_on 'Register customer'

    # Personal
    fill_in 'First name', with: 'Hannes'
    fill_in 'Last name', with: 'Wüthrich'
    select 'male', from: 'Gender'
    fill_in 'Date of birth', with: '1/1/1982'
    fill_in 'E-Mail', with: 'hw@5px.ch'

    # Address
    click_on 'Address'
    fill_in 'Hotel name', with: 'Dolphin House'
    fill_in 'Room number', with: 'P4'

    # Certification
    click_on 'Certification'
    fill_in 'Certification name', with: 'PADI Open Water'
    fill_in 'Certification number', with: '123F4567890'
    fill_in 'Last dive', with: '1/1/2013'
    fill_in 'Number of dives', with: 10

    # Save
    click_on 'Create Customer'

    expect(Customer.count).to eq(1)

    expect(page).to have_content 'Dolphin House - Room P4'
  end

  scenario 'Search customer', js: true do
    create :customer, first_name: 'Peter', last_name: 'Lustig'

    visit root_path

    # Search
    fill_in 'Search customer', with: "Pet"
    page.execute_script("$('#customers-search form').submit()")

    expect(page).to have_content 'Lustig Peter'
  end

  scenario 'Show 10 recent customers by default' do

    11.times do |n|
      create :customer, first_name: 'Customer %02d' % (n+1), updated_at: n.hours.ago
    end

    visit customers_path

    expect(page).to have_content 'Customer 02'
    expect(page).to have_content 'Customer 11'
    expect(page).not_to have_content 'Customer 01'

  end

end
