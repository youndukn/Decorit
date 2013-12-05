Decorit::Application.routes.draw do
  devise_for :users
  
  devise_scope :user do
    get 'register', to: 'devise/registrations#new', as: :register
    get 'login', to: 'devise/sessions#new', as: :login

    get 'logout', to: 'devise/sessions#destroy', as: :logout
  end

  resources :publishes
  get 'feed', to: 'publishes#index', as: :feed
  root to: 'publishes#index'
end
