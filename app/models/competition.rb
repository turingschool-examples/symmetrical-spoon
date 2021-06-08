class Competition < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  has_many :teams

  def average_players_age
    Player.joins(teams: :competition).where("competitions.id = ?", self.id).average('players.age')
  end
end
