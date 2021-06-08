# app/models/competition

class Competition < ApplicationRecord 
  has_many :registrations, dependent: :destroy
  has_many :teams, through: :registrations 

end