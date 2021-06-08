require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:team_competitions) }
    it { should have_many(:teams).through(:team_competitions) }
  end
end
