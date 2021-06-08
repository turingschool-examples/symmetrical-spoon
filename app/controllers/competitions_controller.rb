class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])

    @teams = @competition.teams

    @average_age = @competition.average_age_of_all_players
  end
end
