class Team < ApplicationRecord
  has_many :players
  has_many :competitions, through: :brackets
  has_many :brackets
end