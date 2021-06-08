Rails.application.routes.draw do
  get '/', to: 'competitions#index'
  get '/:id', to: 'competitions#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
