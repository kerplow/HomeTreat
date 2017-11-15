class PagesController < ApplicationController
  skip_before_action :authenticate_specialist!, only: :home
  skip_before_action :authenticate_client!, only: :home

  def home
  end
end
