require 'rails_helper'

RSpec.describe Registration, type: :model do
  it {should belong_to :team}
  it {should belong_to :competition}
end
