module Customers
  class BookingsController < ApplicationController

    active_navbar_item :customers

    responders :flash, :http_cache, :collection

    expose(:customer)
    expose(:bookings) { customer.bookings.includes{event.trip}.chronological }
    expose(:booking, attributes: :booking_params)

    def destroy
      booking.destroy
      respond_with booking, location: [customer, :bookings]
    end

    def update
      booking.save
      respond_with booking, location: [customer, :bookings]
    end

    def create
      booking.save
      respond_with booking, location: [customer, :bookings], action: :index
    end

    private

    def booking_params
      params.require(:booking).permit(:price, :event_id)
    end

  end
end
