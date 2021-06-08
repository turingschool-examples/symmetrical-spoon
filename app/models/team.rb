class Team < ApplicationRecord
  validates_presence_of :hometown

  has_many :team_competitions
  has_many :competitions, through: :team_competitions
end