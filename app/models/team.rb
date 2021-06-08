class Team < ApplicationRecord
  has_many :players
  has_many :brackets
  has_many :competitions, through: :brackets
end