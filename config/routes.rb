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
end
