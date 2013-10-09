EventbriteClone::Application.routes.draw do

  root to: "users#index"
  get "/users/new", to: "users#new", as: "signup"
  get "/login", to: "sessions#new", as: "login"
  get "/logout", to: "sessions#destroy", as: "logout"
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  get "/help", to: "static_pages#help", as: "help"
  get "/about", to: "static_pages#about", as: "about"
  get "/terms_of_service", to: "static_pages#terms_of_service", as: "terms_of_service"
  get "/careers", to: "static_pages#careers", as: "careers"

end
