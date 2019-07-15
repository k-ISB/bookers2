Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update]
  root to: 'home#top'
  root 'home#about'
 end
