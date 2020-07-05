Rails.application.routes.draw do
  root 'items#index'
  resources :users, only: [:index, :edit, :update]
  devise_for :users


  resources :profiles, only: [:new]

  resources :items, only: [:index, :show, :new]
  resources :send_informations, only: [:new, :edit, :update]
end

