competition_1 = Competition.create!(name: "Competition 1", location: "Denver", sport: "Basketball")
competition_2 = Competition.create!(name: "Competition 2", location: "Boulder", sport: "Football")
team_1 = Team.create!(hometown: "Leesburg", nickname: "The Lee's")
team_2 = Team.create!(hometown: "Nashville", nickname: "The Nash Bash")
competition_1.teams << team_1
competition_1.teams << team_2