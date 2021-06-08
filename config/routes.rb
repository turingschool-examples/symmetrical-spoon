Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :competitions do
    resources :teams, only: [:new, :create]
  end

  get '/teams', to: 'teams#index'
end
