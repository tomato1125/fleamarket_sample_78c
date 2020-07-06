Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root "users#index"
  resources :users, only: [:edit, :update]
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items, only: [:index, :show]
  root 'items#index'
  root 'items#buy'
  resources :items do
    member do
      get 'buy'
    end
  end
end

