Rails.application.routes.draw do
  # LOGIN ROUTES
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  # Users has one to many relationship with Tasks
  resources :users do
    resources :tasks
  end
end
