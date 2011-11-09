SimpleChat::Application.routes.draw do
  resources :chats do
    post 'message', :on => :member
  end
  root :to => 'chats#index'
end
