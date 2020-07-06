Rails.application.routes.draw do
  root 'items#index'
  devise_for :users
  resources :users, only: [:index, :edit, :update, :destroy]

  resources :items, only: [:index, :show, :new]
  resources :send_informations, only: [:new, :edit, :update]
end

