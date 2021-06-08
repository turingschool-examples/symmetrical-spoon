class Competition < ApplicationRecord
  has_many :teams_in_plays
  has_many :teams, through: :teams_in_plays

  def average_player_age
    # WIP - need to get the where clause down
    Player.all.joins(team: [:competitions]).select("competitions.id, avg(players.age) as average_age").group("competitions.id")
  end

  def avg_age
    # Wasted too much time messinmg around with joins query
    # and had to implement a Ruby solution
    total_age = 0
    sum = self.teams.each do |team|
      if !team.players.empty?
        total_age += team.players.average_age
      end
    end
    total_age / self.teams.length
  end
end
