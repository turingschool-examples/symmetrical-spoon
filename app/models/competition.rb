# app/models/competition

class Competition < ApplicationRecord 
  has_many :registrations, dependent: :destroy
  has_many :teams, through: :registrations 

  def average_all_players_age
    Team.joins(:registrations, :players).where("registrations.competition_id = ?", self.id).average("players.age").to_f
  end
end