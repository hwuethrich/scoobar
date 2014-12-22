module Autocomplete
  class EventsController < ApplicationController

    expose(:events) do
        Event.
          chronological.reverse_order.
          includes{trip}.
          search(params[:q]).
          page params[:page]
    end

    expose(:events_by_date) do
      events.group_by(&:start_date)
    end

    expose(:event)

  end
end
