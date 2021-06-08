class Team < ApplicationRecord
  has_many :players
  has_many :team_competitions
  has_many :competitions, through: :team_competitions

  validates_presence_of :hometown
  validates_presence_of :nickname

  def self.avg_age_sorted_desc
    joins(:players).group(:id).select('teams.*, avg(players.age) as average_age').order(average_age: :desc)
  end
end
