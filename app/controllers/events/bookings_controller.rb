module Events
  class BookingsController < ApplicationController

    active_navbar_item :events

    expose(:event) { Event.find params[:event_id] }
    expose(:bookings) { event.bookings.includes{customer} }
    expose(:booking, attributes: :booking_params)

    def create
      if booking.save
        redirect_to [event, :bookings], notice: 'Booking created'
      else
        render :index
      end
    end

    def update
      if booking.save
        redirect_to [event, :bookings], notice: 'Booking updates'
      else
        render :edit
      end
    end

    def destroy
      booking.destroy
      redirect_to [event, :bookings], notice: 'Booking was successfully deleted.'
    end

    private

    def booking_params
      params.require(:booking).permit(:event_id, :customer_id)
    end
  end
end
