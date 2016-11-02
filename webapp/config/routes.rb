Rails.application.routes.draw do
  get 'settings/show'

  resources :references

  get    '/register',   to: 'users#new'
  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  get    '/logout',     to: 'sessions#destroy'

  get    '/users',      to: 'users#new'
  get    '/users/:id',  to: 'users#new'

  get    '/settings',   to: 'settings#show'
  put '/users',      to: 'users#update'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'sessions#new'

  get "*path" => redirect("/")
end
