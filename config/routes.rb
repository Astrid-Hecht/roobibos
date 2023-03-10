Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:show]
      patch "/subscriptions", to: 'subscriptions#update_zero_knowledge'
      resources :subscriptions, only: [:update]
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
