class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
    @teams = @competition.teams
  end

  private

  # def studio_params
  #   params.permit(:name, :location)
  # end  
end