# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Standard routes
  root to: "home#index"
  resources :users, only: [:update]

  # Admin routes
  namespace :admin do
    resources :users, only: [:index]
    resources :courses, only: [:index, :new, :create]
  end

  # Custom routes
  get "/faq", to: "home#faq", as: :faq
  get "/profile", to: "users#show", as: :profile
  put "/profile", to: "users#update"
  get "/admin", to: "admin/panel#index", as: :admin
end
