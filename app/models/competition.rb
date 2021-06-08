class Competition < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  has_many :teams
end
