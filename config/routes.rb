Rails.application.routes.draw do
  
  
  resources :messages do
    resources :likes
  end
  
  devise_for :users
  root to: 'users#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "/home", to: "users#home", as:'home'

  get "/home/:id", to: "users#home", as:'home_id'
  
  get "/users/:id", to: "users#index", as:'index'
  
  get "/message/mp", to: "messages#message_prive", as: 'mp'

  

  namespace :admin do
    get "/users", to: "users#indexUsers"
    put "/users/:id", to: "users#update"

  end
  
end
