module Statistics

  class Customers

    attr_reader :customers, :range

    def initialize(customers: Customer, range: range)
      @customers = customers
      @range = range
    end

    def count_by_month
      stats = customers.joins{bookings.event}.distinct{bookings.customer_id}.group_by_month(:start_time, format: '%b', range: range)
      stats.magic.send :series, stats.size.relation, 0
    end

  end
end

