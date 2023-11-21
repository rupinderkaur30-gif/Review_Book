Rails.application.routes.draw do
  resources :users
  resources :reviews
  resources :books do
    resources :reviews, only: [:new, :create, :update]
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
get "/login", to: "sessions#new", as: "login"
get "/logout", to: "sessions#destroy"
delete "/logout", to: "sessions#destroy"

resources :sessions, only: [:create]
end
