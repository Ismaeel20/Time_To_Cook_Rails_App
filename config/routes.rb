Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html



  resources :recipes, only: [:show, :create, :destroy, :index, :edit] do
    resources :recipe_timers, only: [:create]
  end
  resources :timers, only: [:index, :destroy, :create]


  # Defines the root path route ("/")
  # root "articles#index"
end
