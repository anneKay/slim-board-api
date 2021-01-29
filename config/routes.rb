Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api, default: { format: :json } do
    post 'auth/login'
    post 'auth/logout'

    resources :users, only: [:create]
  end
end
