require 'rails_helper'

RSpec.describe Competition do
  describe 'relationships' do
    it {should have_many(:tournaments)}
    it {should have_many(:teams).through(:tournament)}
  end

  describe 'class methods' do
    it '::average_player_age' do

      expect(Competition.average_player_age).to be_a(Integer)
    end
  end
end
