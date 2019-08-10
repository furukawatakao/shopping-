Rails.application.routes.draw do

  get 'management_users/index'
  get 'management_users/new'
  get 'management_users/edit'
  get 'management_users/destroy'
  namespace :admin do
    get '/login', to: 'sessions#new'
    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'

    resources :products
    resources :users
    resources :management_users
  end
end
