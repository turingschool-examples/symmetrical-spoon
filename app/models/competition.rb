class Competition < ApplicationRecord
  has_many :tournaments
  has_many :teams, through: :tournaments

  def self.average_player_age
    
  end
end
