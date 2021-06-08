class HometownsController < ApplicationController


  def new
    @competition = Competition.find(params[:id])
  end

  def create
    @competition = Competition.find(params[:id])
    @hometown = Hometown.create!(hometown_params)
    Event.create!(competition: @competition, hometown: @hometown)
    redirect_to "/competitions/#{@competition.id}"
  end

  def hometown_params
    params.permit(:hometown, :nickname)
  end

end
