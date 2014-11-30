require 'rails_helper'

RSpec.feature 'Customer registration:', type: :feature do

  scenario 'Register a new customer', js: true do
    visit root_path
    click_on 'Register customer'

    # Personal
    fill_in 'First name', with: 'Hannes'
    fill_in 'Last name', with: 'Wüthrich'
    select 'male', from: 'Gender'
    fill_in 'Date of birth', with: '1/1/1982'
    fill_in 'E-Mail', with: 'hw@5px.ch'

    # Certification
    click_on 'Certification'
    fill_in 'Certification name', with: 'PADI Open Water'
    fill_in 'Certification number', with: '123F4567890'
    fill_in 'Last dive', with: '1/1/2013'
    fill_in 'Number of dives', with: 10

    # Save
    click_on 'Create Customer'

    expect(Customer.count).to eq(1)
  end

  scenario 'Search customer' do
    Customer.create first_name: 'Peter',
                    last_name: 'Lustig',
                    date_of_birth: 20.years.ago,
                    gender: 'male',
                    email: 'test@example.com'

    visit root_path

    # Search
    fill_in 'Search customer', with: "Han\n"

  end

end
