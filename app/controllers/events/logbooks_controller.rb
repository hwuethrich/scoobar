module Events
  class LogbooksController < ApplicationController

    respond_to :html

    active_navbar_item :events

    expose(:event)
    expose(:logbook) { event.logbook || event.build_logbook(time_in: event.start_time) }

    def create
      save_and_respond_with_logbook
    end

    def update
      save_and_respond_with_logbook
    end

    def destroy
      logbook.destroy
      respond_with logbook, location: [event, :logbook]
    end

    private

    def save_and_respond_with_logbook
      logbook.attributes = logbook_params
      logbook.save
      respond_with logbook, location: [event, :logbook]
    end

    def logbook_params
      params.require(:event_logbook).permit(:max_depth, :time_in, :dive_time, :comments)
    end

  end

end
