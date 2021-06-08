require "rails_helper"

RSpec.describe Player, type: :model do
  describe "relationships" do
    it { belong_to :team}
  end
end
