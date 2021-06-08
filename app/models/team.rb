class Team < ApplicationRecord
  has_many :players
  has_many :team_competitions
  has_many :competitions, through: :team_competitions
  validates_presence_of :hometown
  validates_presence_of :nickname
end
