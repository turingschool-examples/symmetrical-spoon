
class Team < ApplicationRecord
  has_many :competition_teams, dependent: :destroy
  has_many :competitions, through: :competition_teams
  has_many :players

  def self.order_by_average_player_age
    joins(:players).select("teams.name, avg(players.age) as avg_age").group("teams.name").order("avg_age")
  end
end