Rails.application.routes.draw do
  devise_for :users, path: 'api/v1/users',
            controllers: {
              sessions: 'api/v1/users/sessions',
              registrations: 'api/v1/users/registrations'
            }
  namespace :api do
    namespace :v1 do
      get '/members', to: 'members#show'

      resources :brands, only: [:index, :create, :update, :destroy]
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
