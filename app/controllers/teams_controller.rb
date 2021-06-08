class TeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    #binding.pry
    @competition = Competition.find(params[:competition_id])
    @competition.teams.create(hometown: params[:hometown], nickname: params[:nickname])
    redirect_to competition_path(params[:competition_id])
  end
end
