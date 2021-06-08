class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    # binding.pry
    @players_avg_age = @competition.average_age.round(1)
  end
end
