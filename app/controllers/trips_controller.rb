class TripsController < ApplicationController

  active_navbar_item :trips

  expose(:trips) { Trip.alphabetical }
  expose(:trip, attributes: :trip_params)

  def create
    if trip.save
      redirect_to :trips, notice: 'Trip was successfully created.'
    else
      render :new
    end
  end

  def update
    if trip.save
      redirect_to :trips, notice: 'Trip was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    trip.destroy
    redirect_to :trips, notice: 'Trip was successfully deleted.'
  end

  private

  def trip_params
    params.require(:trip).permit(:code, :name, :duration, :color)
  end
end
