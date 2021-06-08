class TeamsController < ApplicationController
  before_action :find_competition

  def index
    @teams = Team.all
  end

  def new
    @team = Team.new
  end

  def create
    team = Team.create(id: find_new_team_id,
                       nickname: params[:nickname],
                       hometown: params[:hometown])

    @competition.teams.push(team)

    redirect_to competition_path(@competition, team)
  end

  def find_competition
    @competition = Competition.find(params[:competition_id])
  end

  def find_new_team_id
    Team.last.id + 1
  end
end
