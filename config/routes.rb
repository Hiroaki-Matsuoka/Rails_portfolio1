Rails.application.routes.draw do
  # get 'posts/index'
  post "likes/:place_id/create" => "likes#create"
  post "likes/:place_id/destroy" => "likes#destroy"
  get 'home/top'
  devise_for :users
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  get '/users/search', to: 'users#search'
  resources :users do
    collection do
    get :mypage
    end
  end
  root to: 'home#top'
  resources :items
  resources :places
  resources :menus
  post 'posts/new' => 'posts#create'
  resources :posts

end
