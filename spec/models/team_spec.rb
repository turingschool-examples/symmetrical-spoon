require 'rails_helper'

RSpec.describe Team, type: :model do
  before :each do
    @pollies = Team.create!(hometown: 'Yelm', nickname: 'Rollie Pollies')
    @babes = Team.create!(hometown: 'Olymipia', nickname: 'Wheelin Babes')
    @demons = Team.create!(hometown: 'Redmond', nickname: 'Speed Demons')
    @gliders = Team.create!(hometown: 'Boring', nickname: 'Gliders')
    @gems = Team.create!(hometown: 'LA', nickname: 'Gray Gems')
    @sand = Team.create!(hometown: 'Laguna Beach', nickname: 'Sand Steppers')

    @hawk = @pollies.players.create!(name: "Hawktapus the Octopus", age: 16)
    @ted = @pollies.players.create!(name: "Teddilicious", age: 11)
    @zep = @pollies.players.create!(name: "Zeppe", age: 15)
    @dalia = @demons.players.create!(name: "Dalia the Destroyer", age: 13)
    @tesh = @demons.players.create!(name: "Tecious Precious", age: 14)
    @simon = @demons.players.create!(name: "Simon Says", age: 15)
  end

  describe 'relationships' do
    it { should have_many(:games) }
    it { should have_many(:competitions).through(:games) }
  end

  describe 'instance methods' do
    it 'can give the average of the teams players' do
      expect(@pollies.ave_players_age).to eq(14)
    end
  end
end
