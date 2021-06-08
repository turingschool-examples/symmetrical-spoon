class Competition < ApplicationRecord
  has_many :team_competitions
  has_many :teams, through: :team_competitions
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :sport
end
