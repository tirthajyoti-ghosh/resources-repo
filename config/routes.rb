Rails.application.routes.draw do
  get 'categories', to: "categories#index"
  get 'categories/:name', to: "categories#show", as: :category
  devise_for :users
  resources :resources
  root to: 'resources#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
