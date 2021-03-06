Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  # User/Session Routes
  post "/users", controller: "users", action: "create"
  post "/sessions", controller: "sessions", action: "create"

  # Property Routes
  get "/properties", controller: "properties", action: "index"
  get "/properties/:id", controller: "properties", action: "show"
  get "/properties/:id/data", controller: "properties", action: "z_basic"
  get "/properties/:id/assessment", controller: "properties", action: "z_assessment"
  post "/properties", controller: "properties", action: "create"
  patch "/properties/:id", controller: "properties", action: "update"
  delete "/properties/:id", controller: "properties", action: "destroy"

  # Tour Routes
  get "/tours", controller: "tours", action: "index"
  get "/tours/:id", controller: "tours", action: "show"
  post "/tours", controller: "tours", action: "create"
  delete "/tours/:id", controller: "tours", action: "destroy"

  # Favorite Routes
  get "/favorites", controller: "favorites", action: "index"
  post "/favorites", controller: "favorites", action: "create"
  delete "/favorites/:id", controller: "favorites", action: "destroy"

  # Image Routes
  get "/images", controller: "images", action: "index"
  get "/images/:id", controller: "images", action: "show"
  post "/images", controller: "images", action: "create"
  patch "/images/:id", controller: "images", action: "update"
  delete "/images/:id", controller: "images", action: "destroy"
end
