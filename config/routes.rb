Rails.application.routes.draw do
  resources :locations
  namespace :api do
    resources :trips
    get '/stats/weekly', to: 'stats#weekly'
    get '/stats/monthly', to: 'stats#monthly'
  end
end
