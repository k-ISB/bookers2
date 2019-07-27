Rails.application.routes.draw do
  get '/home/about', to: 'home#about'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books
  root to: 'home#top'
 end
