Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/auth',
            controllers: {
              sessions: 'api/v1/auth/sessions',
              registrations: 'api/v1/auth/registrations'
            }

  devise_for :clients, path: 'api/v1/auth',
            controllers: {
              sessions: 'api/v1/auth/sessions',
              registrations: 'api/v1/auth/registrations'
            },
            skip: [:registrations]

  namespace :api do
    namespace :v1 do
      resources :brands, only: [:index, :create, :update, :destroy] do
        resources :products
      end
      resources :clients, only: [:index, :create, :update, :destroy]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
