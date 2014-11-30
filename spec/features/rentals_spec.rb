require 'rails_helper'

RSpec.feature 'Rentals:', type: :feature do

  let(:customer) { create :customer }

  scenario 'Rent equipment for customer' do

    category  = create(:equipment_category, name: 'BCD')
    equipment = create(:equipment, name: 'Mares #1', category: category)

    visit customer_path(customer)
    within('#customer-nav') { click_on 'Rentals' }
    expect(page.current_path).to eq customer_rentals_path(customer)

    expect(page).to have_content('No equipment rented by this customer')
    click_on 'Rent Equipment'

    select 'Mares #1', from: 'Equipment'
    click_on 'Create Rental'

    expect(Rental.count).to eq(1)
    expect(page).to have_content 'Mares #1'
    expect(page.current_path).to eq customer_rentals_path(customer)
  end

  scenario 'Edit existing rental' do
    rental = create(:rental, customer: customer)
    equipment = create :equipment, name: 'BCD #2'

    visit customer_rentals_path(customer)
    within('.table-rentals') { click_on rental.equipment.name }

    select 'BCD #2', from: 'Equipment'
    click_on 'Update Rental'

    rental.reload

    expect(rental.equipment).to eq(equipment)
    expect(page.current_path).to eq(customer_rentals_path(customer))
  end

  scenario 'Delete existing rental' do
    rental = create(:rental, customer: customer)

    visit customer_rentals_path(customer)
    within('.table-rentals') { click_on 'Delete' }

    expect(Rental.count).to be_zero
    expect(page.current_path).to eq(customer_rentals_path(customer))
  end

end
