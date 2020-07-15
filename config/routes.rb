Rails.application.routes.draw do
  
  devise_for :users
  root "posts#index"
  resources :posts
  get 'search', to: 'posts#search'
end