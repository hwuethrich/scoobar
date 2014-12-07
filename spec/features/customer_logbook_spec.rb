require 'rails_helper'

RSpec.feature 'Customer Logbook:' do

  let(:customer) { create(:customer) }

  scenario 'Generate PDF from previous events' do
    create_list :booking, 10, customer: customer

    visit customer_path(customer)
    click_on 'Bookings'

    click_on 'Logbook'

    expect(page.response_headers['Content-Type']).to eq 'application/pdf'
  end

end
