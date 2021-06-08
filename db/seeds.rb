require 'factory_bot_rails'

competitions = []
teams = []

10.times do
  competitions << Competition.create!(FactoryBot.attributes_for(:competition))
end

15.times do
  teams << Team.create!(FactoryBot.attributes_for(:team))
end

teams.each do |team|
  player = team.players.create!(FactoryBot.attributes_for(:player))
end

competitions.each do |c|
  t = teams.sample 3
  c.teams << t
end


