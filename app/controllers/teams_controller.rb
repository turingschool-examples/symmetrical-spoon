class TeamsController < ApplicationController
  def new
    @team = Team.new
    @competition_id = params[:competition_id]  end

  def create
    # binding.pry
    competition = Competition.find(params[:team][:competition_id])
    competition.teams.create!(hometown: params[:team][:hometown], nickname: params[:team][:nickname])

    redirect_to "/competitions/#{competition.id}"
  end
end
