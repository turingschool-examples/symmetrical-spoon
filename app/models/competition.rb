class Competition < ApplicationRecord
  validates_presence_of :location

  has_many :team_competitions
  has_many :teams, through: :team_competitions
end