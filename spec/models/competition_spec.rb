#spec/models/competition_spec

require 'rails_helper'

RSpec.describe Compeition do
  describe 'relationships' do
    it { should have_many(:registrations) }
    it { should have_many(:teams).through(:registrations) }
  end
end