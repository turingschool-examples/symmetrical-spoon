class EventsController < ApplicationController
  def create
    @competition = Competition.find(params[:id])
    @hometown = Hometown.create(hometown_params)
    Event.create!(competition: @competition, hometown: @hometown)
    redirect_to "competion/#{@competion.id}"
  end

  def hometown_params
    params.permit(:hometown, :nickname)
  end
end
