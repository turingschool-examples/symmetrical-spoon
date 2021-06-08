class Competition < ApplicationRecord
  has_many :team_competitions
  has_many :teams, through: :team_competitions
  has_many :players, through: :teams
  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :sport

  def average_age_of_all_players
    players.average(:age).to_i
  end
end
