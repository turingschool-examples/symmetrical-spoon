class Player < ApplicationRecord
  belongs_to :team    

  def self.average_age
    age = 0
    Player.all.each do |player|
      age += player.age
    end  
    age = age / Player.all.count.round
  end
end