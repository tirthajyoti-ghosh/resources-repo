Rails.application.routes.draw do
  get 'categories', to: "categories#index"
  get 'categories/:name', to: "categories#show", as: :category
  devise_for :users
  resources :resources do
    resources :comments, only: [:create]
    resources :votes, only: [:create]
  end
  root to: 'resources#index'
end
