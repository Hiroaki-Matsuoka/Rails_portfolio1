Rails.application.routes.draw do
  get 'home/top'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resources :users, only: :show
  root to: 'items#index'
  resources :items
end
