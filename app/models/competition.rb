class Competition < ApplicationRecord
  has_many :competition_entries, dependent: :destroy
  has_many :teams, through: :competition_entries
  has_many :players, through: :teams

  def average_player_age
    players.average(:age).to_f
  end
end