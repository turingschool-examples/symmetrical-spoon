class Team < ApplicationRecord
  has_many :players
  has_many :competitions, through: :tournaments
end
