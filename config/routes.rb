Rails.application.routes.draw do
  devise_for :users
  root  'static_pages#home'
  get   '/products/new'
  get   '/help',                to: 'static_pages#help'
  get   '/products/addsku',     to: 'products#new'
  get   '/products/index',      to: 'products#index'
  get   '/carts',               to: 'carts#index'
  get   '/carts/cart',          to: 'carts#cart'
  post  '/carts/new',           to: 'carts#create'
  post  '/totes/new',           to: 'totes#create'
  post  '/carts/edit',          to: 'carts#edit'
  resources :products
  resources :carts
  resources :totes

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
