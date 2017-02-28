Rails.application.routes.draw do
  resources :users, :guilds
  resources :login, :only => [:create, :new, :destroy]

  root 'guilds#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
