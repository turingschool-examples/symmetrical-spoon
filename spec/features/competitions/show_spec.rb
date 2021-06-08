require 'rails_helper'

RSpec.describe 'competitions show page' do
  before :each do
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

  describe 'name, location and sport' do
    it 'can list competitions attributes' do
      visit "/competitions/#{@blue.id}"

      expect(page).to have_content("#{@blue.name}")
      expect(page).to have_content("#{@blue.location}")
      expect(page).to have_content("#{@blue.sport}")
    end

    it 'can list the competitions teams and their attributes' do
      visit "/competitions/#{@blue.id}"

      expect(page).to have_content("#{@pollies.nickname}")
      expect(page).to have_content("#{@pollies.hometown}")
      expect(page).to have_content("#{@babes.hometown}")
      expect(page).to have_content("#{@babes.nickname}")
    end
  end
end
