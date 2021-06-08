class TeamsController < ApplicationController
  def index
    @teams = Team.avg_age_sorted_desc
  end
end
