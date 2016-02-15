Rails.application.routes.draw do

  resources :products
  resources :categories
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  devise_for :users, controllers: {
    sessions: 'users/sessions'
  }

  namespace :admin do
    resources :products
  end

  get '/contact' => 'products#contact'

  root 'products#index'
end
