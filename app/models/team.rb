class Team < ApplicationRecord
  has_many :players
  has_many :registrations
  has_many :competitions, through: :registrations

  def self.avg_player_age
    joins(:players)
    .average(:age)
  end

  def self.by_player_avg_age
    left_outer_joins(:players)
    .select("teams.*, AVG(players.age) AS avg_age")
    .group(:id)
    .order("avg_age DESC")
  end
end
