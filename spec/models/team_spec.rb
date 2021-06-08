require 'rails_helper'

RSpec.describe Team do
  describe 'validations' do
    it { should validate_presence_of :hometown }
    it { should validate_presence_of :nickname }
  end

  describe 'relationships' do
    it { should have_many :tourneys }
  end
end
