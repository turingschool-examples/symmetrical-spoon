class Competition < ApplicationRecord
  has_many :teams, through: :brackets
  has_many :brackets
end