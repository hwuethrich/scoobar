require 'rails_helper'

RSpec.feature 'Customer logbook:' do

  let(:customer) { create(:customer) }

  scenario 'Generate PDF from previous events' do
    create_list :booking, 10, customer: customer

    visit customer_path(customer)
    click_on 'Bookings'

    click_on 'Logbook'
  end

end
