Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config

  put '/users/:id/generate_api_token', to: 'users#generate_api_token', as: 'user_generate_api_token'

  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
      resources :domains, only: [:index, :show, :create, :update, :destroy] do
        resources :records, only: [:index, :show, :create, :update, :destroy]
      end
    end
  end
end
