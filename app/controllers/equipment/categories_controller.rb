class Equipment::CategoriesController < ApplicationController

  active_navbar_item :equipment

  respond_to :html

  expose(:categories) { Equipment::Category.all }
  expose(:category, attributes: :category_params)

  def new
    respond_with category
  end

  def create
    category.save
    respond_with category, location: :equipment_categories
  end

  def update
    category.update category_params
    respond_with category, location: :equipment_categories
  end

  def destroy
    category.destroy
    respond_with category
  end

  private

  def category_params
    params.require(:equipment_category).permit(:name)
  end

end
