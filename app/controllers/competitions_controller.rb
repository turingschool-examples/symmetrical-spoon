class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @teams = @competition.teams
    @competition_players = @competition.player_list
    # @competition_players = @teams.joins(:players).average(:age)

  end
end
