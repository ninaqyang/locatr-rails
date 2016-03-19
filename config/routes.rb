Rails.application.routes.draw do
  apipie

  devise_for :users, controllers: { registrations: 'api/users/registrations', sessions: 'api/users/sessions' }

  root 'home#index'

  namespace :api, defaults: { format: :json } do
    resources :users
    resources :events
  end

  resources :users
  resources :events
end
