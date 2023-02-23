Rails.application.routes.draw do
  resources :subscription_teas
  resources :subscriptions
  resources :customers
  resources :teas
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
