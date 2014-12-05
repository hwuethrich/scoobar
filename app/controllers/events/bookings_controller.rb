module Events
  class BookingsController < ApplicationController

    active_navbar_item :events

    expose(:event) { Event.find params[:event_id] }
    expose(:bookings) { event.bookings.includes{customer} }
    expose(:booking, attributes: :booking_params)

    def create
      booking.save
      respond_with booking, location: [event, :bookings]
    end

    def update
      booking.save
      respond_with booking, location: [event, :bookings]
    end

    def destroy
      booking.destroy
      respond_with booking, location: [event, :bookings]
    end

    private

    def booking_params
      params.require(:booking).permit(:event_id, :customer_id)
    end
  end
end
