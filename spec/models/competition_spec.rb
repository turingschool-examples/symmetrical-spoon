require 'rails_helper'

RSpec.describe Competition do

  describe 'relationships' do
    it {should have_many(:team_competitions)}
    it {should have_many(:teams).through(:team_competitions)}
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:location)}
    it {should validate_presence_of(:sport)}
  end
end
