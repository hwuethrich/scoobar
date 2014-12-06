class GuidesController < ApplicationController

  active_navbar_item :guides

  responders :flash, :http_cache, :collection

  expose(:guides) { Guide.alphabetical }
  expose(:guide, attributes: :guide_params)

  def create
    guide.save
    respond_with guide
  end

  def update
    guide.save
    respond_with guide
  end

  def destroy
    guide.destroy
    respond_with guide
  end
  private

  def guide_params
    params.require(:guide).permit(:name)
  end
end
