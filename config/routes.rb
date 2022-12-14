require 'sidekiq/web'
require 'sidekiq-status/web'
Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'navigations/index'
    end
  end
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount ActionCable.server => "/cable"
  mount Sidekiq::Web => '/sidekiq'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "admin/dashboard#index"
end
