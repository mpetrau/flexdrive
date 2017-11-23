Rails.application.routes.draw do

  resources :offers, only: [:show, :index]
  resources :vehicles, except: [:destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
