require 'rails_helper'

RSpec.describe Game, type: :model do
  it { should belong_to(:competition) }
  it { should belong_to(:team) }
end
