class Competition < ApplicationRecord
  has_many :teams_in_plays
  has_many :teams, through: :teams_in_plays

end
