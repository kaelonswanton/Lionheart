Rails.application.routes.draw do
  devise_for :users
  root "categories#index"
  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'

  resources :categories, only: [:show, :index]
  resources :products, only: [:index]

  namespace :admin do
    resources :base, only: [:index]
    resources :categories
    resources :products
  end
end
 