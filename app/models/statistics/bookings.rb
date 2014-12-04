module Statistics

  class Bookings

    attr_reader :bookings, :range

    def initialize(bookings: Booking, range: range)
      @bookings = bookings
      @range = range
    end

    def count
      bookings.joins{event}.where{event.start_time.in my{range}}.count
    end

    def count_by_month
      stats = bookings.joins{event}.group_by_month(:start_time, format: '%b', range: range)
      stats.magic.send :series, stats.size.relation, 0
    end

  end
end

