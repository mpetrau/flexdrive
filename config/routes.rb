Rails.application.routes.draw do

  root "admin/dashboard#index"




  # resources :order, only: [:index]
  devise_for :users

  ActiveAdmin.routes(self)

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :orders, only: [ :index, :show, :update, :create ]
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
