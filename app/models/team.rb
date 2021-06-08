class Team < ApplicationRecord

  has_many :players
  has_many :team_competitions
  has_many :competitions, through: :team_competitions

  def self.all_by_average_player_age
    joins(:players).group(:id).select('teams.*, avg(players.age) as age_avg').order('age_avg desc')
  end

  def self.players_average_age(team_id)
    joins(:players).where('teams.id = ?', team_id).average(:age).to_i
  end
end
