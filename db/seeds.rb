Competition.destroy_all
Team.destroy_all
TeamCompetition.destroy_all
# Player.destroy_all


@comp_1 = Competition.create!(name: 'Regional Cup', location: "Louville", sport: 'basketball')
@comp_2 = Competition.create!(name: 'Premier Cup', location: 'Las Vegas', sport: 'basketball')

@team_1 = Team.create!(hometown: 'Leesburg', nickname: 'Rockets')
@team_2 = Team.create!(hometown: 'Pitt', nickname: 'Pirates')
@team_3 = Team.create!(hometown: 'Seattle', nickname: 'Sharks')

TeamCompetition.create!(team_id: @team_1.id, competition_id: @comp_1.id)
TeamCompetition.create!(team_id: @team_2.id, competition_id: @comp_1.id)
TeamCompetition.create!(team_id: @team_2.id, competition_id: @comp_2.id)
TeamCompetition.create!(team_id: @team_3.id, competition_id: @comp_2.id)

# @player_1 = Player.create!(name: 'Billy Russo', age: 12)