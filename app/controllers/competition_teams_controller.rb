class CompetitionTeamsController < ApplicationController

  def create
    @team = Team.find_by(name: params[:name], hometown: params[:hometown])
    @competition = Competition.find(params[:competition_id])
    CompetitionTeam.create(competition: @competition, team: @team)
    redirect_to "/competitions/#{@competition.id}"
  end

  def new
    @competition = Competition.find(params[:competition_id])
  end
end