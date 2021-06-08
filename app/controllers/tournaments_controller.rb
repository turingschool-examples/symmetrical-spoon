class TournamentsController < ApplicationController

  def create
    team = Team.find_by(nickname: params[:nickname])
    competition = Competition.find(params[:competition_id])
    Tournament.create!(team: team, competition: competition)
    redirect_to "/competitions/#{competition.id}"
  end
end
