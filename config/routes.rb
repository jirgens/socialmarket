SocialMarket::Application.routes.draw do

  devise_for :users, controllers: { registrations: 'registrations' }

  resources :users, only: [:show, :index, :edit, :update]
    resources :products
    get '/users/profile'
    get '/user/:id/products', to: 'user#index'


  get 'following', to: 'relationships#index'
  get 'relationships', to: 'relationships#index'
  resources :relationships, only: [:create, :destroy]
  resources :sales, only: [:create, :new, :index, :show]
  root to: 'products#index'
end
