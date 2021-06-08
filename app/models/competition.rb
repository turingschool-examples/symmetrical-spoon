class Competition < ApplicationRecord
  has_many :brackets
  has_many :teams, through: :brackets

end