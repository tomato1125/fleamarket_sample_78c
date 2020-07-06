Rails.application.routes.draw do
  devise_for :users
  root 'users#index'
  resources :users, only: [:index, :edit, :update, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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

