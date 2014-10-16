require 'rails_helper'

RSpec.describe "bookings/show", :type => :view do
  before(:each) do
    @booking = assign(:booking, Booking.create!(
      :event => nil,
      :customer => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
  end
end
