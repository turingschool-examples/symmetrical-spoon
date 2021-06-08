class CompetitionEntriesController < ApplicationController
  def new
    @competition = Competition.find(params[:competition_id])
  end

  def create
    competition = Competition.find(params[:competition_id])
    team = Team.find_by(nickname: params[:nickname], hometown: params[:hometown])
    if team.present?
      entry = CompetitionEntry.create(competition_id: competition.id, team_id: team.id)
      redirect_to competition_path(competition.id)
    else
      redirect_to new_competition_competition_entry_path(competition.id)
      flash[:alert] = 'Error: Information entered does not match any team in our system'
    end
  end
end