require 'rails_helper'

RSpec.describe Item, type: :model do
  it { has_many(:competitions) }
end
