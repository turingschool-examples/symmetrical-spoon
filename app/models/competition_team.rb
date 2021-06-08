class CompetitionTeam < ApplicationRecord
  belongs_to :competitions
  belongs_to :teams
end
