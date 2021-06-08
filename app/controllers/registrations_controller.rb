class RegistrationsController < ApplicationController
  
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    team = Team.where(nickname: params[:nickname]).first
    competition = Competition.find(params[:competition_id])
    Registration.create(team: team, competition: competition)
    redirect_to "/competitions/#{competition.id}"
  end
end