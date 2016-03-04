Rails.application.routes.draw do
  apipie
  devise_for :users

  root 'home#index'

  namespace :api do
    resources :users
    resources :events
  end

  resources :users
  resources :events
end
