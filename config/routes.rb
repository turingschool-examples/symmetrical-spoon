Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/competitions', to: 'competitions#index'
  get '/competitions/:id/new', to: 'competitions#new'
  get '/competitions/:id', to: 'competitions#show'
  post 'competitions/:id', to: 'competitions#create'
end
