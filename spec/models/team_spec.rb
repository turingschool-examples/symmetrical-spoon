require 'rails_helper'

RSpec.describe Team do
  describe 'relationships' do
    it { should have_many(:competition_teams).dependent(:destroy) }
    it { should have_many(:competitions).through(:competition_teams) }
    it { should have_many(:players) }
  end

  describe 'validations' do
  it { should validate_presence_of(:nickname) }
  it { should validate_presence_of(:hometown) }
end
end
