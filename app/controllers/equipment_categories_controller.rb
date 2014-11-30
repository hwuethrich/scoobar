class EquipmentCategoriesController < ApplicationController

  respond_to :html

  expose(:equipment_categories) { EquipmentCategory.all }
  expose(:equipment_category, attributes: :equipment_category_params)

  def new
    respond_with equipment_category
  end

  def create
    equipment_category.save
    respond_with equipment_category, location: :equipment_categories
  end

  def update
    equipment_category.update equipment_category_params
    respond_with equipment_category, location: :equipment_categories
  end

  def destroy
    equipment_category.destroy
    respond_with equipment_category
  end

  private
    def set_equipment_category
      @equipment_category = EquipmentCategory.find(params[:id])
    end

    def equipment_category_params
      params.require(:equipment_category).permit(:name)
    end
end
