require 'rails_helper'

RSpec.describe Competition, type: :model do
  before :each do
    @game1 = Game.create!(competition_id: @blue, team_id: @pollies)

    @blue = Competition.create!(name: 'Blue National', location: 'Tacoma', sport: 'Extreme Cartwheeling')
    @hilly = Competition.create!(name: 'Hilly Ride', location: 'Bend', sport: 'Downhill Skiiing')
    @walk = Competition.create!(name: 'Walk till ya drop', location: 'Irvine', sport: 'Speed Walking')

    @pollies = @blue.teams.create!(hometown: 'Yelm', nickname: 'Rollie Pollies')
    @babes = @blue.teams.create!(hometown: 'Olymipia', nickname: 'Wheelin Babes')
    @demons = @hilly.teams.create!(hometown: 'Redmond', nickname: 'Speed Demons')
    @gliders = @hilly.teams.create!(hometown: 'Boring', nickname: 'Gliders')
    @gems = @walk.teams.create!(hometown: 'LA', nickname: 'Gray Gems')
    @sand = @walk.teams.create!(hometown: 'Laguna Beach', nickname: 'Sand Steppers')

    @hawk = @pollies.players.create!(name: "Hawktapus the Octopus", age: 16)
    @ted = @pollies.players.create!(name: "Teddilicious", age: 11)
    @zep = @pollies.players.create!(name: "Zeppe", age: 15)
    @dalia = @demons.players.create!(name: "Dalia the Destroyer", age: 13)
    @tesh = @demons.players.create!(name: "Tecious Precious", age: 14)
    @simon = @demons.players.create!(name: "Simon Says", age: 15)
  end

  describe 'relationships' do
    it { should have_many(:games) }
    it { should have_many(:teams).through(:games) }
  end
end
