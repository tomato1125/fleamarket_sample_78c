Rails.application.routes.draw do
  root 'items#index'
  resources :users, only: [:index, :edit, :update] do
    resources :send_informations, only: [:new, :create, :edit, :update]
  end

  devise_for :users
  resources :items, only: [:index, :show, :new, :buy]

  resources :items do
    member do
      get 'buy'
    end
  end
end

