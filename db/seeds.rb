# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Player.destroy_all
Competition.destroy_all
Team.destroy_all

comp_1 = Competition.create!(name: 'Show Me What You Got', location: 'Space', sport: 'Performance art')
comp_2 = Competition.create!(name: 'Intergalactic Baseball', location: 'The Milky Way', sport: 'Baseball')
comp_3 = Competition.create!(name: 'MeSeeks', location: 'Earth', sport: 'Unclear')

team_1 = Team.create!(hometown: 'Froopyland', nickname: 'Rainbow Rivers')
team_2 = Team.create!(hometown: 'Earth', nickname: 'MeeSeeks')
team_3 = Team.create!(hometown: 'Dog Dimension', nickname: 'The Hydrants')

comp_1.teams << team_1
comp_1.teams << team_2

comp_2.teams << team_2
comp_2.teams << team_3

player_1 = Player.create!(name: "Morty Smith", age: 14, team_id: team_1.id)
player_2 = Player.create!(name: "Rick Sanchez", age: 70, team_id: team_1.id)
player_4 = Player.create!(name: "Summer Smith", age: 17, team_id: team_2.id)
player_5 = Player.create!(name: "Beth Smith", age: 34, team_id: team_2.id)
player_3 = Player.create!(name: "Jerry Smith", age: 40, team_id: team_3.id)