class CompetitionTeamsController < ApplicationController
  def index
    @competition_teams = CompetitionTeams.all
  end

end
