require 'rails_helper'

RSpec.describe Competition do

  describe 'relationships' do
    it {should have_many :teams_in_plays}
    it {should have_many(:teams).through(:teams_in_plays)}
  end
end
