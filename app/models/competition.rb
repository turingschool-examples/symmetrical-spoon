class Competition < ApplicationRecord
  validates :name, presence: true
  validates :location, presence: true

  has_many :teams

  # def all_passengers
  #   self.passengers
  #       .where("passengers.age > ?", 17)
  #       .select("passengers.*")
  #       .distinct
  #       .order("passengers.age") #ordering so the test passes consistently
  # end
end
