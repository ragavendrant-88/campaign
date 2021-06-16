class DashboardsController < ApplicationController
  def index
    @campaigns = Campaign.all
  end
end
