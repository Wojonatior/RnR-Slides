Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  scope :api do
    scope :v1 do
      post 'auth/login', to: 'api/v1/authentication#authenticate'
      resources :slideshows do
        resources :slides
      end
    end
  end
end
