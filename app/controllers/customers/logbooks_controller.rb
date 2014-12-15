module Customers
  class LogbooksController < ApplicationController

    expose(:customer)
    expose(:bookings) { customer.bookings }

    def show
      logbook = CustomerLogbook.new customer
      send_data logbook.render, disposition: :attachment, filename: 'logbook.pdf', type: 'application/pdf'
    end

  end
end
