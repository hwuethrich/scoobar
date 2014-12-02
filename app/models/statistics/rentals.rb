module Statistics

  class Rentals

    attr_reader :rentals, :range

    def initialize(rentals: Rental, range: range)
      @rentals = rentals
      @range = range
    end

    def count_by_month
      stats = rentals.group_by_month(:start_time, format: '%b', range: range)
      stats.magic.send :series, stats.size.relation, 0
    end

  end
end

