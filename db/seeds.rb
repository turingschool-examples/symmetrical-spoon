# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

TeamPlayer.destroy_all
Player.destroy_all
Team.destroy_all
Competition.destroy_all

@competition_1 = Competition.create!(name: 'Mens Regional', location: 'Louisville', sport: 'basketball')
@competition_2 = Competition.create!(name: 'Northeast Invitational', location: 'New York', sport: 'pickleball')
@team_1 = @competition_1.teams.create!(hometown: 'Leesburg', nickname: 'Rockets')
@team_2 = @competition_1.teams.create!(hometown: 'Houston', nickname: 'Jaguars')
@team_3 = @competition_2.teams.create!(hometown: 'Denver', nickname: 'Nuggets')
@player_1 = Player.create!(name: 'Billy Bigshoes', age: 12)
@player_2 = Player.create!(name: 'Steph Curry', age: 24)
@player_3 = Player.create!(name: 'Joe Schmoe', age: 30)
@player_4 = Player.create!(name: 'Pat Smith', age: 38)
@player_5 = Player.create!(name: 'Jamie Jones', age: 41)

@player_6 = Player.create!(name: 'Jill Smith', age: 20)

TeamPlayer.create!(team: @team_1, player: @player_1)
TeamPlayer.create!(team: @team_1, player: @player_2)
TeamPlayer.create!(team: @team_1, player: @player_3)
TeamPlayer.create!(team: @team_2, player: @player_4)
TeamPlayer.create!(team: @team_2, player: @player_5)
TeamPlayer.create!(team: @team_3, player: @player_6)
