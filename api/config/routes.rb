Rails.application.routes.draw do
  devise_for :users

  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'auth/registrations'
      }
      resources :users, only: [:index, :update]
      resources :messages, only: [:index]
      resources :rooms_users, only: [:index]
      resources :rooms, only: [:index]
    end
  end
end
