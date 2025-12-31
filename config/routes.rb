Rails.application.routes.draw do
  devise_for :users
  resources :movies do
    resources :ratings, only: [:create,:update]
    resources :comments, only: [:index,:edit,:create,:update,:destroy]
  end
  root "movies#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
