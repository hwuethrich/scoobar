class EquipmentController < ApplicationController

  active_navbar_item :equipment

  respond_to :html

  expose(:equipments) { Equipment.all }
  expose(:equipment, ancestor: :equipments, attributes: :equipment_params)

  def new
    respond_with equipment
  end

  def create
    equipment.save
    respond_with equipment, location: [:equipment, :index]
  end

  def update
    equipment.update equipment_params
    respond_with equipment, location: [:equipment, :index]
  end

  def destroy
    equipment.destroy
    respond_with equipment
  end

  private

  def equipment_params
    params.require(:equipment).permit(:name, :category_id, :comment)
  end

end
