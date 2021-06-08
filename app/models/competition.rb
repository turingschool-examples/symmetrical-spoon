class Competition < ApplicationRecord
  has_and_belongs_to_many :teams

  def average_player_age
    teams.joins(:players).average('players.age').to_i
  end
end
