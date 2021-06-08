class Competition < ApplicationRecord
  has_many :competition_teams, dependent: :destroy
  has_many :teams, through: :competition_teams
  has_many :players, through: :teams
end