Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
  
  get "/about", to: "about#index"

  get "/password/reset", to: "password_resets#new"
  post "/password/reset", to: "password_resets#create"

  get "/password/reset/edit", to: "password_resets#edit"
  patch "/password/reset/edit", to: "password_resets#update"


  get "/password", to: "passwords#new"
  patch "/password", to: "passwords#update"

  get "/signup", to: "signup#new"
  post "/signup", to: "signup#create"
  
  get "/signin", to: "session#new"
  post "/signin", to: "session#create"
  
  get "/remove", to: "session#remove"
  
  root to: "main#index"
  # Defines the root path route ("/")
  # root "articles#index"
end
