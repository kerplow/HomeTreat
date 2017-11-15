class SpecialistsController < ApplicationController
  skip_before_action :authenticate_specialist!, only: [:index, :show]
  skip_before_action :authenticate_client!, only: [:index, :show]

  def index
    @specialists = Specialist.all
  end

  def show
    @specialist = Specialist.find(params[:id])
  end
end
