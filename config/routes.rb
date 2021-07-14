Rails.application.routes.draw do

  resources :campaigns do
    resources :npcs
    resources :pcs
    resources :jobs
    resources :systems do
      resources :notable_places
    end
    resources :factions
  end
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
