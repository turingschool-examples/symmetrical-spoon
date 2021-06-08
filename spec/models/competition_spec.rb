require 'rails_helper'

RSpec.describe Competition, type: :model do
  it {should have_many :teams}
  it {should have_many :registrations}
  it {should have_many(:teams).through(:registrations)}
end
