class TeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    #binding.pry
    redirect_to competition_path(params[:competition_id])
  end
end
