# app/controllers/competition_controller.rb

class CompetitionsController < ApplicationController

  def index
    @competitions = Competition.all
  end

  def show
    @competition = Competition.find(params[:id])
  end

end