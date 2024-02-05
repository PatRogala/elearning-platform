# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Standard routes
  root to: "pages#show", slug: "home"
  resource :profile, only: [:show, :edit, :update], controller: "users"
  resources :courses, only: [:index, :show]
  resources :pages, only: [:show], param: :slug

  # Admin routes
  namespace :admin do
    resource :panel, only: [:show]
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

  # Used to display faq static page
  get "/faq", to: "pages#faq"

  # Used to display cookie-policy static page
  get "/cookie-policy", to: redirect("/pages/cookie-policy")

  # Used to display main admin index page
  get "/admin", to: redirect("/admin/panel")
end
