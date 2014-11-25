module Customers
  class BookingsController < ApplicationController

    active_navbar_item :customers

    expose(:customer)
    expose(:bookings) { customer.bookings.includes{event.trip} }

  end
end
