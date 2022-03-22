Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  # Defines the root path route ("/")
  root "payments#index"
  get "payments/coingate", to: "payments#coingate",  as: "coingate"

  resources :users 
  resources :items
  resources :payments
end
