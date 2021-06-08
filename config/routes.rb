Rails.application.routes.draw do

  get '/competitions', to: 'competitions#index'
  get '/competitions/:id', to: 'competitions#show'
  get '/competitions/:id/new', to: 'competitions#new'
  post '/competitions/:id/new', to: 'competitions#create'
end
