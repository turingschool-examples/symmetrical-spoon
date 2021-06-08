require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'relationships' do
    it { should have_and_belong_to_many :competitions }
    it { should have_many :players }
  end
end
