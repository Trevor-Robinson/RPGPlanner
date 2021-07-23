Rails.application.routes.draw do

  resources :campaigns do
    resources :npcs
    resources :pcs
    resources :jobs do
      resources :job_factions
    end  
    resources :systems do
      resources :notable_places
    end
    resources :factions do
      resources :turves
    end
  end
  devise_for :users
  get 'home/index'
  root to: "home#index"
end
