class EventsController < ApplicationController

  active_navbar_item :events
  respond_to :html, :json

  expose(:event, attributes: :event_params)
  expose(:events) { Event }
  expose(:events_on_current_day) { events.intersects(current_start_time, current_end_time) }
  expose(:events_in_morning)   { events_on_current_day.select(&:starts_in_morning?)   }
  expose(:events_in_afternoon) { events_on_current_day.select(&:starts_in_afternoon?) }

  expose(:current_day) { current_day }

  def index
    self.events = Event.chronological.includes{[trip, boat, guide, logbook, bookings.customer]}
  end

  def new
    event.attributes = event_params if params[:event]
    event.start_time ||= event_default_start_time
  end

  def create
    save_and_respond_with_event
  end

  def update
    save_and_respond_with_event
  end

  def destroy
    event.destroy
    respond_with event, location: events_path(date: event.start_time.to_date)
  end

  private

  def save_and_respond_with_event
    event.save
    respond_with event, location: -> { [:edit, event] }
  end

  def current_day
    Date.parse params[:date]
  rescue
    Date.today
  end

  def current_start_time
    current_day.beginning_of_day
  end

  def current_end_time
    current_day.end_of_day
  end

  def event_params
    params.require(:event).permit(
      :name, :start_time, :end_time, :duration, :description,
      :trip_id, :night_dive, :boat_id, :capacity, :guide_id, :price)
  end

  def event_default_start_time
    time = DateTime.now
    time = time.change(hour: time.hour + 1) if time.min > 30
    time.change(min: 0)
  end

end
