Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users, only: [:create]
      resources :authentication, only: [:create, :update, :destroy]
      resources :projects, only: [:create, :update, :destroy]
      resources :tasks, only: [:create, :update, :destroy]
      resources :comments, only: [:create, :destroy]
      get '/*a', to: 'application#not_found'
    end
  end
end
