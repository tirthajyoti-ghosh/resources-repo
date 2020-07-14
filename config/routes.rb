Rails.application.routes.draw do
  get 'categories', to: "categories#index"
  get 'categories/:name', to: "categories#show", as: :category
  devise_for :users
  resources :resources do
    resources :comments, except: [:show]
  end
  root to: 'resources#index'
end
