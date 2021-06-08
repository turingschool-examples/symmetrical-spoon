require 'rails_helper'
# User Story 1 - Competition Index

# As a user
# When I visit the competion index
# Then I see the names of all competitions
# Each competition name links to its show page

RSpec.describe 'competition index page' do
  describe 'display' do
    before :each do 
      indigo = Competition.create!(name: "Indigo League", location: "Louisville", sport:"rocket launching")
      scarlet = Competition.create!(name: "Scarlet League", location: "Dencer", sport: "tap dancing")
    end
  end
end