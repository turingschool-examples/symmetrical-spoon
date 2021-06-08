class TeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    competition = Competition.find(params[:competition_id])
    competition.teams.create(hometown: params[:hometown], nickname: params[:nickname])
    redirect_to "/competitions/#{competition.id}"
  end


end