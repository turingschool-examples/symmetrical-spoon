class CompetitionsController < ApplicationController

  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @teams = @competition.teams
    @average_age = @competition.players_average_age 
  end

end
