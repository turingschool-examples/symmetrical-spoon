require 'rails_helper'

RSpec.describe Team, type: :model do
  it { should have_many(:games) }
  it { should have_many(:competitions).through(:games) }
end
