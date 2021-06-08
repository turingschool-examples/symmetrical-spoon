class TeamsController < ApplicationController
  def new
    @team = Team.new
    @competition_id = params[:competition_id]
  end

  def index
    @teams = Team.by_player_avg_age
  end

  def create
    if params[:team][:competition_id] != ""
      competition = Competition.find(params[:team][:competition_id])
      competition.teams.create!(team_params)

      redirect_to "/competitions/#{competition.id}"
    else
      Team.create!(team_params)
      redirect_to "/teams"
    end
  end

  private
  def team_params
    params.require(:team).permit(:hometown, :nickname)
  end
end
