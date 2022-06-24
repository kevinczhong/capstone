Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  #Property Routes
  get "/properties", controller: "properties", action: "index"
  get "/properties/:id", controller: "properties", action: "show"
  post "/properties", controller: "properties", action: "create"
  patch "/properties/:id", controller: "properties", action: "create"
  delete "/properties/:id", controller: "properties", action: "destroy"
end
