Rails.application.routes.draw do
  root to: 'user#index'

  resources :user

  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'

    resources :products
  end

end
