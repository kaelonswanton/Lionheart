Rails.application.routes.draw do
  devise_for :users
  root "home#home"
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'

  resources :categories
  resources :products
  resources :posts
  resources :comments

  namespace :admin do
    resources :base, only: [:index]
    resources :categories
    resources :products
    resources :posts
  end
end
 