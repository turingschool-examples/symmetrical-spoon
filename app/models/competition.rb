class Competition < ApplicationRecord

  has_many :competition_teams, dependent: :destroy
  has_many :teams, through: :competition_teams

  def average_player_age
    if self.teams.joins(:players).average(:age) != nil
      self.teams.joins(:players).average(:age).round(2)
    else
      'Add a team.'
    end
  end
end
