require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it { should have_many(:competition_teams).dependent(:destroy) }
    it { should have_many(:teams).through(:competition_teams) }
  end
end
