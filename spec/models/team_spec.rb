require 'rails_helper'

RSpec.describe Team do
  describe 'realtionships' do
    it {should have_many(:players)}
    it {should have_many(:team_competitions)}
    it {should have_many(:competitions).through(:team_competitions)}
  end

  describe 'validations' do
    it {should validate_presence_of(:hometown)}
    it {should validate_presence_of(:nickname)}
  end
end
