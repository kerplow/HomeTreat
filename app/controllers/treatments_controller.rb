class TreatmentsController < ApplicationController
    skip_before_action :authenticate_specialist!, only: [:show]
  skip_before_action :authenticate_client!, only: [:show]

  def show
    @treatment = Treatment.find(params[:id])
  end
end
