require 'rails_helper'

RSpec.feature 'Equipment Categories:', type: :feature do

  scenario 'Add category' do
    visit root_path
    click_on 'Equipment'
    click_on 'Categories'

    expect(page).to have_content('No equipment categories yet')

    click_on 'Add Category'

    fill_in 'Name', with: 'BCD'
    click_on 'Create Category'

    expect(Equipment::Category.count).to eq(1)
    expect(page).to have_content 'BCD'
    expect(page.current_path).to eq('/equipment/categories')
  end

  scenario 'Edit categories' do
    category = create(:equipment_category, name: 'BCC')

    visit equipment_categories_path
    within('table.equipment-categories') do
      click_on 'BCC'
    end

    fill_in 'Name', with: 'BCD'
    click_on 'Update Category'

    within('table.equipment-categories') do
      expect(page).to have_content 'BCD'
    end
  end

end
