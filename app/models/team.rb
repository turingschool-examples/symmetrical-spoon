class Team < ApplicationRecord
  has_and_belongs_to_many :competitions
  has_many :players, dependent: :destroy

  def self.sorted_teams_by_player_age
    Team.joins(:players).select('teams.*, avg(players.age)::numeric(10,0) as average_player_age').group('teams.id').order(average_player_age: :desc)
  end
end
