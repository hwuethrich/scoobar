module Autocomplete
  class BoatsController < ApplicationController

    expose(:boats) do
      boats = Boat.alphabetical
      boats = boats.search(params[:q]) if params[:q].present?
      boats.limit(10)
    end

    expose(:boat)

  end
end
