Rails.application.routes.draw do
  devise_for :users, controllers: {
        registrations: 'users/registrations',
        passwords: 'users/passwords'
  }
  root to: 'posts#index'
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
  resources :users, only: [:show]

  post '/posts/guest_sign_in', to: 'posts#new_guest'
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#new_guest'
  end
end
