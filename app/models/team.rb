class Team < ApplicationRecord
  has_many :teams_in_plays
  has_many :competitions, through: :teams_in_plays

end
