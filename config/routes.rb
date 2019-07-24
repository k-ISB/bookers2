Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  resources :books
  root to: 'home#top'
  get 'home/about' => 'home#about'
 end
