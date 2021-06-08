class Team < ApplicationRecord
  has_many :players
  has_many :competition_entries, dependent: :destroy
  has_many :competitions, through: :competition_entries

  def self.by_avg_age
    joins(:players)
    .select('teams.*, avg(players.age) as avg_age')
    .group(:id)
    .order('avg_age desc')
  end
end