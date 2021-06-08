class TeamsController < ApplicationController

  def new
      @competition = Competition.find(params[:id])
  end
end
