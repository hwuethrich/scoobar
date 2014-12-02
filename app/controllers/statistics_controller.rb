class StatisticsController < ApplicationController

  expose(:year) { params.fetch(:year, Date.today.year).to_i }
  expose(:range) { Date.new(year, 1, 1)..Date.new(year, 12, 31) }

  expose(:event_statistics) { Statistics::Events.new range: range }
  expose(:events_count_by_month) { event_statistics.count_by_month }

  expose(:rental_statistics) { Statistics::Rentals.new range: range }
  expose(:rentals_count_by_month) { rental_statistics.count_by_month }

  expose(:booking_statistics) { Statistics::Bookings.new range: range }
  expose(:bookings_count_by_month) { booking_statistics.count_by_month }

  expose(:customer_statistics) { Statistics::Customers.new range: range }
  expose(:customers_count_by_month) { customer_statistics.count_by_month }


end
