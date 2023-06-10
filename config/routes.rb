Rails.application.routes.draw do
  get 'converter/index'
  get 'converter/convert'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/recipe_info", to: "recipe_info#index"
  resources :recipes, only: [:show, :create, :destroy, :index, :edit, :update] do
    resources :recipe_timers, only: [:create]
  end

  resources :recipe_timers, only: [:edit, :update, :destroy]
  resources :timers, only: [:index, :destroy, :create, :edit, :update]

  # Defines the root path route ("/")
  # root "articles#index"
end
