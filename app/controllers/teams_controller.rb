class TeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:id])
  end

  def create
    @competition = Competition.find(params[:id])
    team = Team.new(team_params)

    if team.save
      @competition.teams << team
      redirect_to "/competitions/#{team_params[:id]}/show"
    end
  end

  private

  def team_params
    params.permit(:hometown, :nickname, :id)
  end
end