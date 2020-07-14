Rails.application.routes.draw do
  # rootはトップページに指定
  root 'items#index'

  # userに関する記載箇所
  devise_for :users
  resources :users, only: [:index, :edit, :update, :show, :destroy], shallow: true do
    resources :send_informations, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :profiles, only: [:new, :create]
  end

  # profileに関する記載箇所
  

  # send_informationに関する記載箇所

  # itemに関する記載箇所
  resources :items, only: [:index, :show, :new, :buy]
  resources :items do
    member do
      get 'buy'
      post 'pay'
    end
  end

  # creditに関する記述
  resources :credits, only: [:index, :new , :create, :show, :destroy]

  # categoryに関する記述
  resources :categories ,only: :index

end
