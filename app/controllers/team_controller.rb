class TeamController <ApplicationController

  def new
  end

  def create
    team = Team.new(team_params)
    team.save
    redirect_to "/competitions"
  end

  private

  def team_params
    params.permit(:nickname, :hometown)
  end
end