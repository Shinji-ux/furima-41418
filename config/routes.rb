Rails.application.routes.draw do
  devise_for :users
  
  root "items#index"
  resources :items
  resources :purchase_records, only: [:new, :create]
end

