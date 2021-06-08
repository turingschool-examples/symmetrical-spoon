Rails.application.routes.draw do
  get '/', to: 'competitions#index'
  get '/teams', to: 'teams#index'
  get '/:id', to: 'competitions#show'
  post '/:id/update', to: 'competitions#update'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
