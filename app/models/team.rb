class Team < ApplicationRecord

  has_many :competition_teams, dependent: :destroy
  has_many :competitions, through: :competition_teams
  has_many :players

  validates_presence_of :nickname, :hometown

end
