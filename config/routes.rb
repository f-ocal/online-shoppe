Rails.application.routes.draw do

  resources :products
  resources :categories
  resource :cart, only: [:show]
  resources :order_items, only: [:create, :update, :destroy]

  namespace :admin do
    resources :products
  end

  devise_for :users, controllers: {
      sessions: 'user/sessions'
  }

  get '/contact' => 'products#contact'

  root 'products#index'
end
