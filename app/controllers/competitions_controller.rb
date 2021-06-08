class CompetitionsController < ApplicationController
  def index
    @comps = Competition.all
  end

  def show
    @comp = Competition.find(params[:id])
    @teams = @comp.teams
  end
end
