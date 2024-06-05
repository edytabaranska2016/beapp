Rails.application.routes.draw do
  namespace :api do
    resources :trips
    # get '/trips', to: 'trips#index'
    # post '/trips/:params', to: 'trips#create'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
