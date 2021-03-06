Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :posts
  resources :comments
  devise_scope :user do
    root :to => "devise/sessions#new"
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
end
