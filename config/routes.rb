Rails.application.routes.draw do
  root to: 'users#index'
  resources :users

  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    resources :products
  end

end
