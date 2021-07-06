Rails.application.routes.draw do

  resources :campaigns do
    resources :npcs
  end
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
