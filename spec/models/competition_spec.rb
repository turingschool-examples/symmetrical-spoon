require 'rails_helper'

RSpec.describe Competition do
  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :location }
    it { should validate_presence_of :sport }
  end

  describe 'relationships' do
    it { should have_many :tourneys }
    it { should have_many(:teams).through(:tourneys) }
  end
end
