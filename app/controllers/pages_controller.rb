class PagesController < ApplicationController
  skip_before_action :authenticate_specialist!, only: [:home, :index, :show]
  skip_before_action :authenticate_client!, only: [:home, :index, :show]

  def home
  end
end
