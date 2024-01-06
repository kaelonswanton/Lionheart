Rails.application.routes.draw do
  devise_for :users
  root "home#home"
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'

  resources :categories
  resources :products
  resources :posts
  resources :comments

  resources :carts, only: [:show, :destroy]
  post 'cart_products/:id/add', to: "cart_product#add_quantity", as: "cart_product_add"
  post 'cart_products/:id/reduce', to: "cart_products#reduce_quantity", as: "cart_product_reduce"
  #resources :line_items, only: [:create, :destroy, :show]


  namespace :admin do
    resources :base, only: [:index]
    resources :categories
    resources :products
    resources :posts
  end
end
 