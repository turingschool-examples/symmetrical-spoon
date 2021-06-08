require 'rails_helper'

RSpec.describe Competition, type: :model do
  it { has_many(:teams) }
end
