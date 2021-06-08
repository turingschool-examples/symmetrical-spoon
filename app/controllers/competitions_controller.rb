class CompetitionsController < ApplicationController
  def index
    @comps = Competition.all
  end

  def show
    @comps = Competition.find(params[:id])
  end
end
