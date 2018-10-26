Rails.application.routes.draw do
  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
  devise_for :users
  get 'auth/signup', as: :sign_up
  get 'auth/signin', as: :sign_in
  post 'session/create', to: 'sessions#create', as: :login
  post 'position/create', to: 'positions#create'
  get 'positions', to: 'positions#index', as: :locate
  resources :users, only: [] do
   resources :chats, only: [:index, :show, :create]
  end
  resources :messages, only:[:create]
  root 'home#index'
end
