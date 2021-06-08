class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @teams = @competition.teams
  end

  def new
    @competition = Competition.find(params[:id])
  end

  def create
    # binding.pry
    @competition = Competition.find(params[:id])
    team = Team.create!(hometown: params[:hometown],
                nickname: params[:nickname]
                )
    redirect_to "/competitions/#{@competition.id}"
  end
end
