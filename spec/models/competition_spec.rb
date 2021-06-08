require 'rails_helper'

RSpec.describe Competition, type: :model do
  describe 'validations' do
    it { should validate_presence_of :location }
    it { should have_many :team_competitions}
    it { should have_many :teams}
  end
end