class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find params[:id]
  end

  def update
    competition = Competition.find params[:id]
    competition.teams << Team.find(params[:teams])
    redirect_to "/#{competition.id}"
  end
end
