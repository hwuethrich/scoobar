module Events

  class LogbooksController < ApplicationController

    respond_to :html

    expose(:event)
    expose(:logbook) { event.logbook }

    def create
      logbook.update_attributes logbook_params
      respond_with logbook, url: event_logbook_path(event)
    end

    private

    def logbook_params
      params.require(:event_logbook).permit(:max_depth, :time_in, :dive_time, :comment)
    end

  end

end
