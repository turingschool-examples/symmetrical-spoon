class Team < ApplicationRecord
  has_many :players
  has_many :games
  has_many :competitions, through: :games

  def ave_players_age
    players.average(:age)
  end
end
