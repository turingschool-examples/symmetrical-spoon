class TeamsController < ApplicationController

  def new
    @competition = Competition.find(params[:competition_id])
    @team = Team.new
  end

  def create
    team = Team.new(nickname: params[:team][:nickname], hometown: params[:team][:location])
    competition = Competition.find(params[:team][:competition_id])

    if team.save
      CompetitionTeam.create(team: team, competition: competition)
      redirect_to competition_path(competition)
    else
      redirect_to competition_path(competition)
      flash[:alert] = "Error: #{team.errors.full_messages.to_sentence}"
    end
  end

end
