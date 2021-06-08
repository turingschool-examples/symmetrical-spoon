class Competition < ApplicationRecord
  validates_presence_of :name, :location, :sport

  has_many :tourneys
end
