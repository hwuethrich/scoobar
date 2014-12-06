require 'rails_helper'

RSpec.feature 'Guides:', type: :feature do

  before(:each) { create :equipment_category, name: 'BCD' }

  scenario 'Add guide' do
    visit root_path
    click_on 'Guides'

    expect(page).to have_content('No guides yet')

    click_on 'Add Guide'

    fill_in 'Name', with: 'John Doe'
    click_on 'Create Guide'

    expect(Guide.count).to eq 1

    guide = Guide.last
    expect(guide.name).to eq 'John Doe'
    expect(page.current_path).to eq guides_path
  end

  scenario 'Edit guide' do
    guide = create(:guide, name: 'John Doe')

    visit guides_path
    within('.table-guides') do
      click_on 'John Doe'
    end

    fill_in 'Name', with: 'Jane Doe'
    click_on 'Update Guide'

    within('.table-guides') do
      expect(page).to have_content 'Jane Doe'
    end
  end

  scenario 'Delete guide' do
    guide = create(:guide, name: 'John Doe')

    visit guides_path
    within('.table-guides') do
      find('.btn-delete').click()
    end

    expect(page).to have_content('No guides yet')
  end

end
