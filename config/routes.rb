Rails.application.routes.draw do
  devise_for :users
  root "home#home"
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'

  resources :categories
  resources :products
  resources :posts
  resources :comments
  resources :orders

  post 'line_items/:id/add', to: "line_items#add_quantity", as: "line_item_add"
  post 'line_items/:id/reduce', to: "line_items#reduce_quantity", as: "line_items_reduce"
  resources :line_items, only: [:create, :destroy, :show]

  get 'carts/:id', to: "carts#show", as: "cart"
  delete 'carts/:id', to: "carts#destroy"

  namespace :admin do
    resources :base, only: [:index]
    resources :categories
    resources :products
    resources :posts
  end
end
 