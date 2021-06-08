class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @team_hometowns = Competition.hometowns(@competition)
    @average_age = Competition.average_age(@competition)
  end

  def new
    @competition = Competition.find(params[:id])
  end

  def create
    @competition = Competition.find(params[:id])
    team = Team.find_team(params)
  end
end