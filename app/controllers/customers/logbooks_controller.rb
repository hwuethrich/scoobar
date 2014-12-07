module Customers
  class LogbooksController < ApplicationController

    expose(:customer)
    expose(:bookings) { customer.bookings }

    def show
      logbook = CustomerLogbook.new customer
      send_data logbook.render, disposition: :inline, filename: 'logbook.pdf', type: 'application/pdf'
    end

  end
end
