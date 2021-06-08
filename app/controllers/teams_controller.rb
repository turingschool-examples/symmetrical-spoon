class TeamsController < ApplicationController
  def new
    @competition = Competition.find(params[:id]) 
    require 'pry'; binding.pry
  end
  
  def create
    team = Team.new(team_params)    
    competition = Competition.find(params[:id])
    redirect_to competition_path(@competition)
  end 

  private
  def team_params
    params.permit(:hometown, :nickname)
  end 
end