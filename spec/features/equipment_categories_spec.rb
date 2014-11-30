require 'rails_helper'

RSpec.feature 'Equipment categories:', type: :feature do

  scenario 'Add equipment category' do
    visit root_path
    click_on 'Equipment categories'

    expect(page).to have_content('No equipment categories yet')

    click_on 'Add category'

    fill_in 'Name', with: 'BCD'
    click_on 'Create Equipment category'

    expect(EquipmentCategory.count).to eq(1)
    expect(page).to have_content 'BCD'
    expect(page.current_path).to eq('/equipment_categories')
  end

  scenario 'Edit equipment_categories' do
    category = create(:equipment_category, name: 'BCC')

    visit equipment_categories_path
    within('table.equipment-categories') do
      click_on 'BCC'
    end

    fill_in 'Name', with: 'BCD'
    click_on 'Update Equipment category'

    within('table.equipment-categories') do
      expect(page).to have_content 'BCD'
    end
  end

end
