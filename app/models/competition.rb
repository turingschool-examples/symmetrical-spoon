class Competition < ApplicationRecord
  has_many :competition_teams
  has_many :teams, through: :competition_teams


  def self.hometowns(competition)
    competition.teams.distinct.pluck(:hometown)
  end

  def self.average_age(competition)
    competition.teams.joins(:players).average(:age)
  end
end
