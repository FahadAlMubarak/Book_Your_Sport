Rails.application.routes.draw do
  get 'friends/create'
  get 'friends/destroy'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard", to: "pages#dashboard", as: :dashboard

  resources :venues do
    resources :facilities, only: [:show]
  end

  resources :bookings, only: [:create, :show] do
    resources :payments, only: :new
    resources :reviews, only: [:new, :create]
  end
  post '/checkout', to: 'bookings#checkout', as: :checkout
  get 'booking_success/:id', to: 'bookings#success', as: 'booking_success'
  get 'bookings/:id/checkout_summary', to: 'bookings#checkout_summary', as: :checkout_summary

#     resources :reviews, only: [:new, :create]
#   end


  resources :friends, only: [:create, :destroy]


  # post 'slots/:id/multi_bookings', to: 'bookings#multi_create'
  get "user_dashboard", to: "pages#user_dashboard", as: :user_dashboard
  get "owner_dashboard", to: "pages#owner_dashboard", as: :owner_dashboard
  get "users_index", to: "pages#users_index", as: :users_index

  resources :venues

  resources :facilities

  # Defines the root path route ("/")
  # root "posts#index"
end
