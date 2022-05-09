Rails.application.routes.draw do
  resources :memberships, only: :create
  resources :clients, only: [:index, :show, :update]
  resources :gyms
end
