class BoatsController < ApplicationController

  active_navbar_item :boats

  expose(:boats) { Boat.alphabetical }
  expose(:boat, attributes: :boat_params)

  def create
    if boat.save
      redirect_to :boats, notice: 'Boat was successfully created.'
    else
      render :new
    end
  end

  def update
    if boat.save
      redirect_to :boats, notice: 'Boat was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    boat.destroy
    redirect_to :boats, notice: 'Boat was successfully deleted.'
  end

  private

  def boat_params
    params.require(:boat).permit(:code, :name)
  end
end
