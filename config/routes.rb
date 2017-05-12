Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  resources :slideshows do
    resources :slides
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
