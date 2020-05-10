Rails.application.routes.draw do
  devise_for :users
  root 'genres#index'
  resources :users, only: [:edit, :update]
  resources :genres, only: [:index, :new, :create, :edit, :update]
end