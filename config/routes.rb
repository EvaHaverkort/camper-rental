Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :offers, only: [:index, :show]
  
  resources :users do
    resources :bookings, only: [:index, :show, :destroy, :new, :create]
    resources :offers, only: [:index, :show, :destroy, :new, :create, :edit, :update] # all, so only is redudant
  end
end
