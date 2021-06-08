require 'rails_helper'

RSpec.describe Bracket do
  describe 'relationships' do
   it {should belong_to :team}
   it {should belong_to :competition}
  end
end