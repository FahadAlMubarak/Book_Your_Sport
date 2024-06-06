Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check
  get "dashboard", to: "pages#dashboard", as: :dashboard

  resources :venues do
    resources :facilities, only: [:index]
  end

  get "user_dashboard", to: "pages#user_dashboard", as: :user_dashboard
  get "owner_dashboard", to: "pages#owner_dashboard", as: :owner_dashboard
  # Defines the root path route ("/")
  # root "posts#index"
end
