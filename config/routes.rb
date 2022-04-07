Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :posts
  resources :comments
  root "users#login"
  get "/sign_up", to: "users#sign_up"
  post "/create_account", to: "users#create"
  get "/logout", to: "users#log_out"
  post "/create_session", to: "users#create_session"
end
