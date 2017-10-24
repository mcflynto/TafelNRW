Rails.application.routes.draw do
  get 'password_resets/create'

  get 'password_resets/edit'

  get 'password_resets/update'

  get 'users/alluser'

  get 'logout' => 'sessions#destroy', :as => 'logout'

  get 'login' => 'donators#login', :as => 'login'

  post 'verification' => 'donators#verification', :as => 'verification'

  root to: 'static_pages#home'

  resources :organizations
  resources :transporters
  #resources :shares
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
    resources :shares
    post 'delivery',  on: :member
    get  'transport', on: :member
  end
end
