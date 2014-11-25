module Events
  class CalendarController < ApplicationController

    active_navbar_item :events

    expose(:events) { Event.chronological.includes(:trip).intersects(current_start_time, current_end_time) }

    private

    def current_start_time
      params.fetch(:start, Date.today.beginning_of_day).to_datetime
    end

    def current_end_time
      params.fetch(:end, Date.today.end_of_day).to_datetime
    end

  end
end
