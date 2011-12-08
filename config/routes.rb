SimpleChat::Application.routes.draw do
  get 'logout' => "sessions#destroy", :as => "logout"
  get 'login' => "sessions#new", :as => "login"
  get 'signup' => "users#new", :as => "signup"

  resources :users
  resources :sessions

  resources :chats do
    post 'message', :on => :member
  end
  root :to => 'chats#index'
end
