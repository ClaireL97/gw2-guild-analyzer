Rails.application.routes.draw do
  resources :users
  resources :login, :only => [:create, :new, :destroy]


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
