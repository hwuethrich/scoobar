module Customers
  class RentalsController < ApplicationController

    respond_to :html

    active_navbar_item :customers

    expose(:customer)
    expose(:rentals) { customer.rentals }
    expose(:rental, attributes: :rental_params)

    def new
      rental.start_time ||= DateTime.now
    end

    def create
      rental.save
      respond_with rental, location: [customer, :rentals]
    end

    def update
      rental.save
      respond_with rental, location: [customer, :rentals]
    end

    def return
      rental.returned_at DateTime.current
      rental.save
      respond_with rental, location: [customer, :rentals]
    end

    def destroy
      rental.destroy
      redirect_to [customer, :rentals], notice: 'Rental was successfully deleted.'
    end

    private

    def rental_params
      params.fetch(:rental, {}).permit(:equipment_id, :start_time, :end_time)
    end

  end
end
