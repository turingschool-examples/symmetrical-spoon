require 'rails_helper'

RSpec.describe TeamCompetition, type: :model do
  describe 'validations' do
    it { should belong_to :team}
    it { should belong_to :competition}
  end
end