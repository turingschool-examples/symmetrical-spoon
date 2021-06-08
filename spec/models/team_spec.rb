require 'rails_helper'

RSpec.describe Team do

  describe 'relationships' do
    it {should have_many :teams_in_plays}
    it {should have_many(:competitions).through(:teams_in_plays)}
  end

end
