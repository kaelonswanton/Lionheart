Rails.application.routes.draw do
  resources :products, only: [:index]
  resources :categories, only: [:show, :index]
  devise_for :users

  get 'about', to: 'home#about'
  get 'contact', to: 'home#contact'

  root "categories#index"
  namespace :admin do
    resources :categories
    resources :products
  end
end
 