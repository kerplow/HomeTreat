class SpecialistsController < ApplicationController
  skip_before_action :authenticate_specialist!, only: [:index, :show]
  skip_before_action :authenticate_client!, only: [:index, :show]

  def index
    @specialists = Specialist.eager_load(treatments: [:subcategory]).all
    if params[:price]
      params[:price][:min] = 0 if params[:price][:min] == ""
      params[:price][:max] = 1000 if params[:price][:max] == ""
      @specialists = @specialists.joins(:treatments).where("treatments.price BETWEEN ? AND ?", params[:price][:min], params[:price][:max]).uniq
    end

    if params[:subcategory]
      subcategory_id_array = Subcategory.where(name: params[:subcategory]).pluck(:id)
      @specialists = @specialists.where("treatments.subcategory_id IN (?)", subcategory_id_array)
    end

    if params[:rating]
      @specialists = @specialists.where(rating: params[:rating])
    end
  end

  def show
    @specialist = Specialist.find(params[:id])
  end

  private

  def search_params
  end
end
