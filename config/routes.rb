Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :offers do
    resources :bookings, only: [:new, :create] # for a certain offer you will be able to create a booking
  end

  # get :my_offers, to: 'offers#my_offers'

  # offers/:id/bookings/index would not make sense because you want to see all the bookings
  # of a user, and not of that particular offer

  resources :bookings, only: [:index, :show, :destroy] # this is already of that user, this url will only be
  # authenitcate user: you add it in the application controller, so that not all pages are availbile for not logins.

  resources :users, only: [:show] do
    resources :offers, only: [:index]
  end

  # offers/:offer_id/bookings/new, you can make a page for create to, thank you for booking etc.

  # resources :users do
  #   resources :bookings, only: [:index, :show, :destroy, :new, :create]
  #   resources :offers, only: [:index, :show, :destroy, :new, :create, :edit, :update] # all, so only is redudant
  # end
  # user login is implied, you don't need to do user in the url, because that will show
  # the user inofmration, not imply that you are the user.
end
