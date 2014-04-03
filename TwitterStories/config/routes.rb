TwitterStories::Application.routes.draw do

  # root 'users#new' #PLACEHOLDER
  # resources :users, except: :index

  get    "/",               to: "users#new"
  post   "/users",          to: "users#create", as: "users"
  get    "/users/new",      to: "users#new",    as: "new_user"
  get    "/users/:id/edit", to: "users#edit",   as: "edit_user"
  get    "/users/:id",      to: "users#show",   as: "user"
  patch  "/users/:id",      to: "users#update"
  put    "/users/:id",      to: "users#update"
  delete "/users/:id",      to: "users#destroy"

end
