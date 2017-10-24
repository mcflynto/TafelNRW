Rails.application.routes.draw do
  get 'password_resets/create'

  get 'password_resets/edit'

  get 'password_resets/update'

  get 'users/alluser'

  get 'logout' => 'sessions#destroy',     :as => 'logout'

  root to: 'static_pages#home'

  resources :organizations
  resources :transporters
  resources :donation_organizations
  resources :donators do
    resources :donations, only: %i[index show]
  end
  resources :users do
    member do
      get :activate
      patch :confirm
    end
  end
  resources :sessions
  resources :donations do
    resources :donation_organizations
    post 'delivery', on: :member
  end
end
