class EventsController < ApplicationController

  active_navbar_item :events

  respond_to :html, :json

  expose(:events) { Event.chronological }
  expose(:event, attributes: :event_params)

  expose(:current_day) { current_day }

  def new
    event.attributes = event_params if params[:event]
    event.start_time ||= DateTime.now.change(min: 0)
    event.duration   ||= 60
  end

  def create
    respond_to do |format|
      if event.save
        format.html { redirect_to event, notice: 'Event created' }
        format.json { render :event }
      else
        render :new
      end
    end
  end

  def update
    respond_to do |format|
      if event.save
        format.html { redirect_to event, notice: 'Event updated' }
        format.json { render json: event }
      else
        render :edit
      end
    end
  end

  private

  def current_day
    Date.parse params[:date]
  rescue
    Date.today
  end

  def event_params
    params.require(:event).permit(:name, :start_time, :end_time, :duration, :description)
  end

  def event_default_start_time
    time = DateTime.now
    time = time.change(hour: time.hour + 1) if time.min > 30
    time.change(min: 0)
  end

end
