require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should belong_to(:competition) }
    it { should have_many(:team_players) }
    it { should have_many(:players).through(:team_players) }

  end

  describe 'validations' do
    it { should validate_presence_of(:nickname) }
    it { should validate_presence_of(:hometown) }
  end

end
