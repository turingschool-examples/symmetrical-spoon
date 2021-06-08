Rails.application.routes.draw do
  get '/teams', to: 'teams#index'

  get '/competitions', to: 'competitions#index'
  get '/competitions/:id', to: 'competitions#show'

  get '/team_competitions/:id/new', to: 'team_competitions#new'
  post '/team_competitions/:id', to: 'team_competitions#create'
end
