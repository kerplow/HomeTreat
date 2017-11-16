class SpecialistsController < ApplicationController
  skip_before_action :authenticate_specialist!, only: [:index, :show]
  skip_before_action :authenticate_client!, only: [:index, :show]

  def index
    @specialists = Specialist.all
    @specialists = @specialists.where(subcategory: params[:subcategory]) if params[:subcategory]
    # @specialists = @specialists.where(price: params[:price[:min]].to_i..params[:price[:max]].to_i) if params[:price]
    # if params[:rating]
    #   ratings = rating_convert(params[:rating])
    #   @specialists = @specialists.where(rating: ratings )
    # end
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
