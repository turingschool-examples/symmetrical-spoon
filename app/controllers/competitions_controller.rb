class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @teams = @competition.teams

    if @teams.avg_player_age
      @avg_player_age = @teams.avg_player_age
    else
      @avg_player_age = 0
    end
  end
end
