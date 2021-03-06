Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  namespace :api do
    post 'auth/login'
    resources :stories, only: [:create, :update, :destroy]

    resources :users, only: [:create]
  end
end
