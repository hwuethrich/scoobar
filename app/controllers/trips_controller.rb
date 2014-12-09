class TripsController < ApplicationController

  active_navbar_item :admin

  responders :flash, :http_cache, :collection
  respond_to :html

  expose(:trips) { Trip.alphabetical }
  expose(:trip, attributes: :trip_params)

  def create
    trip.save
    respond_with trip
  end

  def update
    trip.save
    respond_with trip
  end

  def destroy
    trip.destroy
    respond_with trip
  end

  private

  def trip_params
    params.require(:trip).permit(:code, :name, :duration, :color, :price)
  end
end
