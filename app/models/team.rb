class Team < ApplicationRecord
  validates :nickname, presence: true
  validates :hometown, presence: true

  belongs_to :competition

  has_many :team_players
  has_many :players, through: :team_players
end
