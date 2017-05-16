Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  scope :api do
    scope :v1 do
      post 'auth/login', to: 'api/v1/authentication#authenticate'
      post 'signup', to: 'users#create'
      resources :slideshows do
        resources :slides
      end
    end
  end
end
