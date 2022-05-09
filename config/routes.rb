Rails.application.routes.draw do
  

  resources :woobly_snacks
  resources :wooblies


  # resources :snacks
  get "/snacks", to: "snacks#index"

  get "snacks/:keyboard_mash", to: "snacks#woobly"

  # post "/login", to:"sessions#create"
  # post "/login", to:"sessions#login"


  resources :users
  # get "/users", to: "users#index"
  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
