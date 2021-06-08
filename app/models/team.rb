class Team < ApplicationRecord
  has_many :registrations
  has_many :competitions, through: :registrations
  has_many :players
end
