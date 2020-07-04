Rails.application.routes.draw do

  resources :users, only: [:edit, :update]
  devise_for :users

  resources :items, only: [:index, :show, :index, :new]
  root 'items#index'
end

