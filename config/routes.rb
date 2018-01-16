Rails.application.routes.draw do
  devise_for :users
  root  'static_pages#home'
  get   'products/new'
  get   '/help',                to: 'static_pages#help'
  get   '/addsku',              to: 'products#new'
  get   '/index',               to: 'products#index'
  get   '/index/:id',           to: 'products#index'
  get   '/products/cart',       to: 'products#cart'
  get   '/carts',               to: 'carts#new'

  resources :products

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
