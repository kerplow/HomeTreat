class SpecialistsController < ApplicationController
  skip_before_action :authenticate_specialist!, only: [:index, :show]
  skip_before_action :authenticate_client!, only: [:index, :show]

  def index
    @specialists = Specialist.all
    params[:price][:min] = 0 if params[:price][:min] == ""
    params[:price][:max] = 1000 if params[:price][:max] == ""
    if params[:subcategory]
    subcategory_id_array = Subcategory.where(name: params[:subcategory]).pluck(:id)
      @specialists = @specialists.joins(:treatments).where("treatments.subcategory_id IN (?)", subcategory_id_array)
    end
    @specialists = @specialists.joins(:treatments).where("treatments.price BETWEEN ? AND ?", params[:price][:min], params[:price][:max])

    if params[:rating]
      @specialists = @specialists.where(rating: params[:rating])
    end

    # @specialists = Specialist.joins(:treatments, :subcategories).includes(:treatments, :subcategories)
    # if params[:subcategory]
    #   subcategory_id_array = Subcategory.where(name: params[:subcategory]).pluck(:id)
    #   @specialists = @specialists.select { |specialist| specialist.treatments.subcategory}

  end

  def show
    @specialist = Specialist.find(params[:id])
  end

  private

  def rating_convert(ratings)
    converted_ratings = []
    ratings.keys do |ratingkey|
      converted_ratings << ratingkey[0]
    end
    converted_ratings
  end
end
