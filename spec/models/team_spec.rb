require 'rails_helper'

RSpec.describe Item, type: :model do
  it { should have_many(:competitions) }
end
