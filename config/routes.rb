# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Standard routes
  root to: "home#index"
  resources :users, only: [:update]
  resources :courses, only: [:index, :show]

  # Admin routes
  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :courses, only: [:index, :new, :create]
  end

  ####
  # Custom routes start here
  #
  # For each new custom route:
  #
  # * Be sure you have the canonical route declared above
  # * Add the new custom route below the existing ones
  # * Document why it's needed
  # * Explain anything else non-standard

  # Used to display singular profile page for the current user
  get "/profile", to: "users#show", as: :profile

  # Used to display the edit profile page for the current user
  get "/profile/edit", to: "users#edit", as: :edit_profile

  # Used to update the current user's profile
  put "/profile", to: "users#update"

  # Used to display main admin panel
  get "/admin", to: "admin/panel#index", as: :admin

  # Used to display the FAQ page
  get "/faq", to: "home#faq", as: :faq

  # Used to display the privacy policy page
  get "/cookies", to: "home#cookies", as: :cookies
end
