class Competition < ApplicationRecord
  validates_presence_of :name, :location, :sport

  has_many :tourneys
  has_many :teams, through: :tourneys
end
