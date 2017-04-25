Rails.application.routes.draw do

  devise_for :users
  resources :messages
  resources :chatrooms do
  	resources :memberships, only: [:create]
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#home'

  get 'home/get_chatrooms', defaults: { format: 'json' }
  get 'home/get_users', defaults: { format: 'json' }

  mount ActionCable.server => '/cable'
end
