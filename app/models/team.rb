class Team < ApplicationRecord
  has_many :players
  has_many :registrations
  has_many :competitions, through: :registrations

  def self.avg_player_age
    joins(:players)
    .average(:age)
  end
end
