Rails.application.routes.draw do
  devise_for :users
  get 'auth/signup', as: :sign_up
  get 'auth/signin', as: :sign_in
  post 'session/create', to: 'sessions#create', as: :login
  post 'position/create', to: 'positions#create'
  get 'positions', to: 'positions#index', as: :locate
  root 'home#index'
end
