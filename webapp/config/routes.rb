Rails.application.routes.draw do
  resources :references

  get    '/register',   to: 'users#new'
  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  get    '/logout',     to: 'sessions#destroy'

  get    '/users',      to: 'users#new'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'
end
