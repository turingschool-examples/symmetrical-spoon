class TeamsController < ApplicationController
  def index
  end

  def new
    @team = Team.new
  end

  def create
    team = Team.create(id: new_id, nickname: params[:nickname], hometown: params[:hometown])
    @competition.find(params[:competition_id])
    @competition.teams << team
    redirect_to competition_path(@competition, team)
  end

  def new_id
    Team.last.id + 1
  end

end
