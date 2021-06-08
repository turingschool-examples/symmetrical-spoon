class Competition < ApplicationRecord
  has_many :events
  has_many :hometowns, through: :events
end
