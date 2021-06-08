class Player < ApplicationRecord
  validates_presence_of :name, :age

  belongs_to :team
end
