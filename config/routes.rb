Rails.application.routes.draw do
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
    resources :users
    resources :users, :except => :index
end
