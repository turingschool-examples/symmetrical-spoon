class Player < ApplicationRecord
  belongs_to :hometown


  def self.average_age
    (sum("age") / count)
  end

end
