Rails.application.routes.draw do

  get '/competitions', to: 'competitions#index'
  get  '/competitions/:id', to: 'competitions#show'

  get '/team/new', to: 'team#new'
  post '/teams', to: 'team#create'
end
