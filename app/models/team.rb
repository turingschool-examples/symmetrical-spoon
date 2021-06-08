class Team < ApplicationRecord
  validates_presence_of :hometown, :nickname

  has_many :players
  has_many :tourneys
end
