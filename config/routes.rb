Rails.application.routes.draw do
  resources :competitions, only: [ :index, :show ] do
    resources :teams, only: [ :new, :create ] do
      resources :players, only: []
    end
  end
  resources :teams, only: :index
end
