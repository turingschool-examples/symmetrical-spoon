# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Competition.destroy_all 
Team.destroy_all 
Registration.destroy_all
Player.destroy_all

@indigo = Competition.create!(name: "Indigo League", location: "Louisville", sport:"rocket launching")
@scarlet = Competition.create!(name: "Scarlet League", location: "Denver", sport: "tap dancing")
@burgundy = Competition.create!(name: "Burgundy League", location: "Austin", sport: "extreme grilling")
@team_1 = Team.create!(hometown: "Beverly Hills", nickname: "Barley")
@jon = @team_1.players.create!(name: "Jon", age: 32)
@yam = @team_1.players.create!(name: "Yam", age: 22)
@mel = @team_1.players.create!(name: "Mel", age: 45)
Registration.create!(competition: @indigo, team: @team_1)

@team_2 = Team.create!(hometown: "Western Town", nickname: "Sunsets")
@yor = @team_2.players.create!(name: "Yor", age: 13)
@mor = @team_2.players.create!(name: "Mor", age: 21)
@flor = @team_2.players.create!(name: "Flor", age: 44)
Registration.create!(competition: @indigo, team: @team_2)

@team_3 = Team.create!(hometown: "Eastern Town", nickname: "Sunrise")
@max = @team_3.players.create!(name: "Max", age: 33)
@chax = @team_3.players.create!(name: "Chax", age: 26)
@flax = @team_3.players.create!(name: "Flax", age: 30)
Registration.create!(competition: @indigo, team: @team_3)

@team_4 = Team.create!(hometown: "Charming Village", nickname: "Magnolia")
@hey = @team_4.players.create!(name: "Hey", age: 23)
@bey = @team_4.players.create!(name: "Bey", age: 24)
@chey = @team_4.players.create!(name: "Chey", age: 25)
Registration.create!(competition: @indigo, team: @team_4)

@team_5 = Team.create!(hometown: "Under the Bridge", nickname: "Rubyists")
@hey = @team_5.players.create!(name: "Hey", age: 22)
@bey = @team_5.players.create!(name: "Bey", age: 21)
@chey = @team_5.players.create!(name: "Chey", age: 22)
Registration.create!(competition: @indigo, team: @team_5)

@team_6 = Team.create!(hometown: "Water Level", nickname: "Aqua People")
@nick = @team_5.players.create!(name: "Nick", age: 22)
@rick = @team_5.players.create!(name: "Rick", age: 21)
@pick = @team_5.players.create!(name: "Pick", age: 22)
Registration.create!(competition: @scarlet, team: @team_6)