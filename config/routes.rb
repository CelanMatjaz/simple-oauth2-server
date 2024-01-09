Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  root "admin#index"
  
  get "/oauth", to: "o_auth#index"
  
  get "/admin", to: "admin#index"

  get "/user", to: "user#index" 
  get "/user/register", to: "user#register" 
  get "/user/login", to: "user#login" 
  post "/user/register", to: "user#create"
  post "/user/login", to: "user#authenticate"
  post "/user/logout", to: "user#logout"

end
