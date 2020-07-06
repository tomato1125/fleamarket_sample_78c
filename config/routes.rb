Rails.application.routes.draw do
  root 'items#index'
  resources :users, only: [:index, :edit, :update]
  devise_for :users
  resources :items, only: [:index, :show, :new, :buy]
  resources :send_informations, only: [:new, :edit, :update]
  resources :items do
    member do
      get 'buy'
    end
  end
end

