class Team < ApplicationRecord
  has_many :registrations
  has_many :competitions, through: :registrations
  has_many :players

  def name
    "#{hometown} #{nickname}".titlecase
  end

  def self.all_with_average_age
    joins(:players)
      .select('teams.*, avg(players.age) as average_age')
      .group(:id)
      .order('average_age DESC')
  end
end
