# app/models/team

class Team < ApplicationRecord 
  has_many :registrations, dependent: :destroy
  has_many :competitions, through: :registrations 
  has_many :players, dependent: :destroy
end