Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  namespace :api do
    namespace :v1 do
      resources :slideshows do
        resources :slides
      end
    end
    #match 'v:api/*path', :to => redirect("/api/v2/%{path}")
    #match '*path', :to => redirect("/api/v2/%{path}")
  end
end
