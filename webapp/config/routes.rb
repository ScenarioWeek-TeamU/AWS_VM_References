Rails.application.routes.draw do
  get    '/projects/new',  to: 'projects#new'
  get    '/references/new',  to: 'references#new'
  get    '/projects/:id',  to: 'projects#index'
  get    '/references/:id',  to: 'references#index'

  resources :projects

  resources :references

  get    '/register',   to: 'users#new'
  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  get    '/logout',     to: 'sessions#destroy'

  get    '/users',      to: 'users#new'
  get    '/users/:id',  to: 'users#new'


  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'static#index'

  get "*path" => redirect("/")
end
