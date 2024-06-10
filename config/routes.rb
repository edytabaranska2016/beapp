Rails.application.routes.draw do
  resources :locations
  namespace :api do
    resources :trips
    get '/weekly_stats', to: 'trips#weekly_stats'
    # post '/trips/:params', to: 'trips#create'
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
