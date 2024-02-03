# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Standard routes
  root to: "home#index"
  resources :users, only: [:update]
  resources :courses, only: [:index]

  # Admin routes
  namespace :admin do
    resources :users, only: [:index, :destroy]
    resources :courses, only: [:index, :new, :create]
  end

  # Custom routes
  get "/faq", to: "home#faq", as: :faq
  get "/profile", to: "users#show", as: :profile
  get "/profile/edit", to: "users#edit", as: :edit_profile
  put "/profile", to: "users#update"
  get "/admin", to: "admin/panel#index", as: :admin
end
