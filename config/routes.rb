Rails.application.routes.draw do
  get 'products/index'
  get 'products/show'
  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    resources :products
    resources :users
    resources :management_users
  end

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  resources :products, :only => [:index, :show] do
    collection do
      post '/search', to: 'products#search'
    end
  end
  resources :users, :except => :index

  resources :carts, only: [:show] do
    member do
      post '/add_item/:product_id' => 'carts#add_item', as: 'add_item'
      post '/update_item/:product_id' => 'carts#update_item', as: 'update_item'
      delete '/delete_item/:product_id' => 'carts#delete_item', as: 'delete_item'
      post '/purchase/:cart_id' => 'carts#purchase', as: 'purchase'
    end
  end
end
