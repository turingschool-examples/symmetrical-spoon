class TeamsController < ApplicationController
  before_action :set_competition, only: %i[ new create ]
  
  def new
    @team = Team.new
  end

  def create
    if @competition.teams.create(team_params)
      flash[:success] = 'Team Registered'
      redirect_to competition_path(@competition)
    end
  end

  private

  def set_competition
    @competition = Competition.find(params[:competition_id])
  end

  def team_params
    params.require(:team).permit(:nickname, :hometown)
  end
end
