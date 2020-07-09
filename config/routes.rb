Rails.application.routes.draw do
  
  root "posts#index"
  resources :posts
  get 'search', to: 'posts#search'
end