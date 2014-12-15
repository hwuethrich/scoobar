class EquipmentController < ApplicationController

  active_navbar_item :admin

  respond_to :html

  expose(:equipments) { Equipment.all }
  expose(:equipment, ancestor: :equipments, attributes: :equipment_params)

  expose(:categories) do
    Equipment::Category.alphabetical.
      includes{equipment}.
      references(:all).
      merge(Equipment.alphabetical)
  end

  def create
    equipment.save
    respond_with_equipment
  end

  def update
    equipment.update equipment_params
    respond_with_equipment
  end

  def destroy
    equipment.destroy
    respond_with_equipment
  end

  private

  def respond_with_equipment
    anchor = 'nav-category-%d' % equipment.category_id if equipment.category_id.present?
    respond_with equipment, location: equipment_index_path(anchor: anchor)
  end

  def equipment_params
    params.require(:equipment).permit(:name, :category_id, :comment)
  end

end
