Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  get '/', to: 'pages#home'
  get 'main', to: 'pages#main'
  get 'profile', to: 'pages#profile'
  get 'records/:id', to: 'records#show', as: :record
  delete 'records/:id', to: 'records#destroy'
  delete 'shops/:id', to: 'shops#destroy'
end
