Rails.application.routes.draw do
 
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new', as: :new_user_registration
   
  end

  devise_for :users, skip: [:sessions], controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'static_pages#home'

  resources :users do
    member do
      get :like_posts
    end
  end

  resources :posts
  resources :comments, only: [:new, :create]
  resources :like_posts, only: [:create, :destroy]
  resources :friendships

  get 'received_request', to: 'friendships#received_request'
  get 'sent_request', to: 'friendships#sent_request'

  get 'search', to: 'users#search'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
