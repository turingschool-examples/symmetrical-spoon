class Competition < ApplicationRecord
  has_many :registrations
  has_many :teams, through: :registrations

  def average_age
    require "pry"; binding.pry
  end
end