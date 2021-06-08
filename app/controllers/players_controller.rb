class CompetitionTeamsController < ApplicationController
  def index
    @players = Player.all
  end
end
