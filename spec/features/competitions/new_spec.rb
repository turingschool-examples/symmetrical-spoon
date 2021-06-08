require 'rails_helper'

RSpec.describe 'new' do
  it 'can create and add new teams to the competition' do
    competition_1 = Competition.create!(name: "Competition 1", location: "Denver", sport: "Basketball")

    visit "competitions/#{competition_1.id}"
    click_button "Add Team"


  end
end