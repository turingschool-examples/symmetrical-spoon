class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @teams = @competition.teams
  end

  # def new
  #   # binding.pry
  #   @competition = Competition.new
  # end
  #
  # def create
  #   # binding.pry
  #   @competition = Competition.find(params[:id])
  #   Team.create(hometown: params[:hometown],
  #               nickname: params[:nickname]
  #               )
  #   redirect_to "/competitions/#{@competition.id}"
  # end
end
