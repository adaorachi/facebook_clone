Rails.application.routes.draw do
  devise_scope :user do
    get 'signup', to: 'devise/registrations#new', as: :new_user_registration
  end
  devise_for :users, skip: [:sessions]
  as :user do
    get 'signin', to: 'devise/sessions#new', as: :new_user_session
    post 'signin', to: 'devise/sessions#create', as: :user_session
    delete 'signout', to: 'devise/sessions#destroy', as: :destroy_user_session
  end

  root 'static_pages#home'

  resources :users do
    member do
      get :liked_posts
    end
  end

  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
