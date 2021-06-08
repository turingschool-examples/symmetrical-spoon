class Player < ApplicationRecord
  validates :name, presence: true
  validates :age, presence: true, numericality: true

  has_many :team_players
  has_many :teams, through: :team_players
end
