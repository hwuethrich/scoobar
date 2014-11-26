module Autocomplete
  class TripsController < ApplicationController

    expose(:trips) do
      trips = Trip.alphabetical
      trips = trips.search(params[:q]) if params[:q].present?
      trips.limit(10)
    end

    expose(:trip)

  end
end
