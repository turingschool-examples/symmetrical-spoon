class Competition < ApplicationRecord
  validates_presence_of :name, :location, :sport

  has_many :tourneys
  has_many :teams, through: :tourneys
  has_many :players, through: :teams

  def average_age
    players.average(:age)
  end
end
