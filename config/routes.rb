Rails.application.routes.draw do
  devise_for :users
  root 'items#index'
  resources :users, only: [:index, :edit, :update, :destroy]

  resources :profiles, only: [:new]

  resources :items, only: [:index, :show, :new]
  resources :send_informations, only: [:new, :edit, :update]
  # root 'items#index'
  resources :items do
    member do
      get 'buy'
    end
  end
end

