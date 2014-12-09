module Customers
  class BookingsController < ApplicationController

    active_navbar_item :customers

    responders :flash, :http_cache, :collection

    expose(:customer)
    expose(:bookings) { customer.bookings.includes{event.trip}.chronological }
    expose(:booking, attributes: :booking_params)

    def destroy
      booking.destroy
      render :index
    end

    def update
      booking.save
      respond_with booking, location: [customer, :bookings]
    end

    private

    def booking_params
      params.require(:booking).permit(:price)
    end

  end
end
