class Competition < ApplicationRecord

  has_many :team_competitions
  has_many :teams, through: :team_competitions

  def players_average_age
    Competition.joins(teams:[:players])
    .where('competitions.id = ?', self.id)
    .average(:age)
  end

end
