Rails.application.routes.draw do
  get 'home/top'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/users/search', to: 'users#search'
  resources :users
  root to: 'items#index'
  resources :items
  resources :places
end
