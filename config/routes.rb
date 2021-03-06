# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  root to: 'sales_reports#index'

  namespace :api do
    resources :messages, only: :create
  end

  resources :sales_reports, only: :index
end
