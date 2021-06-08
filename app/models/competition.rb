class Competition < ApplicationRecord
  has_many :registrations
  has_many :teams, through: :registrations
  has_many :players, through: :teams
end
