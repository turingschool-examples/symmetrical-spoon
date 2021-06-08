require 'rails_helper'

RSpec.describe Competition, type: :model do
  it { should have_many(:games) }
  it { should have_many(:teams).through(:games) }
end
