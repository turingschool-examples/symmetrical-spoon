class CompetitionTeamsController < ApplicationController

  def create
    @team = Team.find_by(name: params[:competition_team][:name], hometown: params[:competition_team][:hometown])
    @competition = Competition.find(params[:competition_id])
    CompetitionTeam.create(competition: @competition, team: @team)
    redirect_to "/competitions/#{@competition.id}"
  end

  def new
    @competition = Competition.find(params[:competition_id])
    @competition_team = CompetitionTeam.new
  end
end