#spec/models/player_spec 

require 'rails_helper'

RSpec.describe Player do
  describe 'relationships' do
    it { should belong_to(:team) }
    it { should have_many(:competitions).through(:team) }
  end
end