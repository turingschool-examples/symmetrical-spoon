class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end

  def new_team
    @competition = Competition.find(params[:id])
  end

  def create_team
    @competition = Competition.find(params[:id])
    @team = @competition.teams.new(nick_name: params[:nick_name], home_town: params[:home_town])
    @team.save
    redirect_to "/competitions/#{@competition.id}"
  end
end
