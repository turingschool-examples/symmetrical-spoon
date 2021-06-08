class Team < ApplicationRecord
  has_many :players
  has_many :competition_entries, dependent: :destroy
  has_many :competitions, through: :competition_entries
end