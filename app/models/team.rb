class Team < ApplicationRecord
  validates_presence_of :hometown
  validates_presence_of :nickname

  has_many :team_competitions
  has_many :competitions, through: :team_competitions
  has_many :players

  def average_age
    players.all.average("age")
  end
end