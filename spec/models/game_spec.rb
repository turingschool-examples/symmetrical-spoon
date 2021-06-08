require 'rails_helper'

RSpec.describe Game, type: :model do
  it { belongs_to(:competitions) }
  it { belongs_to(:teams) }
end
