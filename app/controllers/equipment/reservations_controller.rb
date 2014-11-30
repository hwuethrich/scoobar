module Customers
  class BookingsController < ApplicationController

    active_navbar_item :customers

    expose(:customer)
    expose(:bookings) { customer.bookings.includes{event.trip}.chronological }
    expose(:booking)

    def destroy
      booking.destroy
      render :index
    end

  end
end
