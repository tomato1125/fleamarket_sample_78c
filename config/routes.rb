Rails.application.routes.draw do
  # rootはトップページに指定
  root 'items#index'

  # userに関する記載箇所
  devise_for :users
  resources :users, only: [:index, :edit, :update, :show, :destroy] do
    resources :send_informations, only: [:new, :create, :edit, :update]
  end

  # profileに関する記載箇所
  resources :profiles, only: [:new]

  # itemに関する記載箇所
  resources :items, only: [:index, :show, :new, :buy]
  resources :items do
    member do
      get 'buy'
    end
  end
end