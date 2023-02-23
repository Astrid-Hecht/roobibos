Rails.application.routes.draw do
  resources :customer_subscriptions
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:show]
      resources :subscriptions, only: [:update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
