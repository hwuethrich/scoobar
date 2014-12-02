module Statistics

  class Events

    attr_reader :events, :range

    def initialize(events: Event, range: range)
      @events = events
      @range = range
    end

    def count_by_month
      stats = events.group_by_month(:start_time, format: '%b', range: range)
      stats.magic.send :series, stats.size.relation, 0
    end

  end
end

