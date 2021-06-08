require 'rails_helper'

RSpec.describe Team, type: :model do
  describe 'validations' do
    it { should validate_presence_of :hometown }
    it { should validate_presence_of :nickname }
    it { should have_many :competitions }
    it { should have_many :players }
  end

  # it 'can get average age of players' do
  #   expect(self.average_age).to be_instance_of(integer)
  # end
end