class Team < ApplicationRecord
  has_and_belongs_to_many :competitions
  has_many :players, dependent: :destroy
end
