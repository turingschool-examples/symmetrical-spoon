class Competition < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  has_many :teams
  # has_many :players, through: :teams

  def average_players_age
    # players.average(:age)
    Player.joins(teams: :competition).where("competitions.id = ?", self.id).average('players.age')
  end
end
