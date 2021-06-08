class TeamsController < ApplicationController
  def index
    @teams = Team.all_with_average_age
  end
end