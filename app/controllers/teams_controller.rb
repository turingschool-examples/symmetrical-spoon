# app/controllers/team_controller.rb

class TeamsController < ApplicationController

  def index
    @teams = Team.all
  end
end