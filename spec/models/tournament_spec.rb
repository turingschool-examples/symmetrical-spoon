require 'rails_helper'

describe Tournament do
  describe "relationships" do
    it {should belong_to(:competition)}
    it {should belong_to(:team)}
  end
end
