require 'rails_helper'

RSpec.describe Player, type: :model do
  it { belongs_to(:teams) }
end
