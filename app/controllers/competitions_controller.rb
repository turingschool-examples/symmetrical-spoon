class CompetitionsController < ApplicationController
  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end

  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    @competition = Competition.find(params[:id])
    new_team = @competition.teams.create!(hometown: :hometown, nickname: :nickname, competition_id: @competition.id)

    new_team.update
    redirect_to "/competitions/#{@competition.id}"
  end
end
