class TeamsController < ApplicationController

  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    @competition = Competition.find(params[:competition_id])
    @new_team = Team.create!({
      nickname: params[:nickname],
      hometown: params[:hometown]
    })
    @competition.teams << @new_team
    redirect_to("/competitions/#{@competition.id}")
  end

  def index
    @teams = Team.all_by_average_player_age
  end
end
