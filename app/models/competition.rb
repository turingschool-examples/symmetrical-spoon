class Competition < ApplicationRecord
  has_many :brackets
  has_many :teams, through: :brackets

  def player_av_age
    teams.joins(:players).select(:players).average(:age)
  end
end