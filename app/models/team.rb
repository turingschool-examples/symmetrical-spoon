class Team < ApplicationRecord
  has_many :players
  has_many :competition_teams
  has_many :competitions, through: :competition_teams

  def self.find_team(params)
    find.where(hometown: params[:hometown])
    require 'pry'; binding.pry
  end
end