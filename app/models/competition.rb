class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams

  def player_age
    teams.joins(:players)
    .select("avg(players.age) as average_age")
    .group(:id)
    .first
    .average_age
  end
end
