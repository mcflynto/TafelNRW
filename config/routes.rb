Rails.application.routes.draw do
  get 'password_resets/create'

  get 'password_resets/edit'

  get 'password_resets/update'

  get 'users/alluser'

  get 'logout' => 'sessions#destroy', :as => 'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'static_pages#home'

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
  resources :donations
end
