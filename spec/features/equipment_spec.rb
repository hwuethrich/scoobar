require 'rails_helper'

RSpec.feature 'Equipment:', type: :feature do

  before(:each) { create :equipment_category, name: 'BCD' }

  scenario 'Add equipment' do
    visit root_path
    click_on 'Equipment'

    expect(page).to have_content('No equipment yet')

    click_on 'Add Equipment'

    fill_in 'Name', with: 'Mares Rover #1234'
    fill_in 'Comment', with: 'Missing D-ring'
    select 'BCD', from: 'Category'

    click_on 'Create Equipment'

    expect(Equipment.count).to eq(1)
    expect(page).to have_content 'Mares Rover #1234'
    expect(page.current_path).to eq('/equipment')
  end

  scenario 'Edit equipment' do
    equipment = create(:equipment, name: 'Mares #1234')

    visit equipment_index_path
    within('table.equipment') do
      click_on 'Mares #1234'
    end

    fill_in 'Name', with: 'Mares #12345'
    fill_in 'Comment', with: 'Fixed'
    click_on 'Update Equipment'

    within('table.equipment') do
      expect(page).to have_content 'Mares #12345'
    end
  end

end
