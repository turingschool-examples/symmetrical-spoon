require 'rails_helper'

RSpec.describe 'competition show page' do
  before :each do
    @player_1 = Player.create!(name: "Morty", age: 72)
    @player_1 = Player.create!(name: "Morty", age: 72)
    @player_1 = Player.create!(name: "Morty", age: 72)
    @player_1 = Player.create!(name: "Morty", age: 72)
  end
  
  it 'displays the competition details, incl. name, location, and sport'

  it 'displays the name and hometown of all players in the comp' 

  it 'displays the avg age across all players in the comp'

  it 'can add a team to the competition'
end