class TeamCompetitionsController < ApplicationController
  def new
    @competition = Competition.find(params[:id])
  end

  def create
    competition = Competition.find(params[:id])

    team = Team.create!(nickname: params[:nickname], hometown: params[:hometown])

    TeamCompetition.create!(team_id: team.id, competition_id: competition.id)

    redirect_to "/competitions/#{competition.id}"
  end
end
