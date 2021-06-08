require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'relationships' do
    it {should have_many :registrations}
    it {should have_many(:teams).through(:registrations)}
  end
end
