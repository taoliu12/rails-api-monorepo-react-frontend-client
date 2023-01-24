Rails.application.routes.draw do
  

  resources :woobly_snacks, only: [:create]

  
  resources :wooblies, only: [:index, :create]


  resources :snacks, only: [:index]
  # get "/snacks", to: "snacks#index"

  #### Was Just for Custom Route Example
    # get "snacks/:keyboard_mash", to: "snacks#woobly"
  #### Was Just for Custom Route Example




  resources :users, except: [:index]

      # get    "/users",       to: "users#index"
      # **** get    "/users/admin",       to: "users#index"

    # get    "/users/:id",   to: "users#show"
    # post   "/users",       to: "users#create"
    # patch   "/users/:id",  to: "users#update"
    # delete  "/users/:id",  to: "users#destroy"

  # resources :users, only: [:show, :create, :update, :destroy]
  # Custom User Routes - Outside of RESTFUL Convention

    get "/fresh_batch_of_user_wooblies", to: "users#my_wooblies"

  # Custom User Routes - Outside of RESTFUL Convention





  post   "/login",         to:"sessions#create"
  # post "/login", to:"session#login"

    get    "/userInSession", to:"sessions#get_logged_in_user"
    get    "/me", to:"sessions#get_logged_in_user"
  
  delete "/logout",        to:"sessions#destroy"
  # post "/login", to:"session#logout"

  
  #X# post "/login", to: "application#login"
  ####  Just as a Starter

  

  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end





# class SessionController < ApplicationController




# end
