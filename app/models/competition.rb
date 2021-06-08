class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams
  has_many :players, through: :competition_teams

  # def player_list
  #   self.teams.joins(:players).average(:age)
  # end
end
