Rails.application.routes.draw do

  root to: "listings#index"

  get "listings/mine", to: "listings#mine", as: :my_listings
  get "requests", to: "rental_requests#mine", as: :my_requests

  resources :users, only: [:show, :index, :new, :create]
  resources :listings, only: [:show, :index, :new, :create, :edit, :update, :destroy] do
    resources :rental_requests, path: "requests", only: [:show, :index, :new, :create, :edit, :update, :destroy], shallow: true  do
      post "approve", on: :member
      post "decline", on: :member
    end
  end
  resources :rentals, only: [:show, :index, :edit, :update] do
    post "cancel", on: :member
  end

  get "login", to: "sessions#new", as: :login
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy", as: :logout
end
