Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :slideshows do
        resources :slides
      end
      post 'auth/login', to: 'api/v1/authentication#authenticate'
      post 'signup', to: 'users#create'
    end
  end
end
