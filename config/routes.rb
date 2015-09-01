Rails.application.routes.draw do

  resources :users

  get 'sessions/create'

  resources :recipes
	get 'welcome' => 'welcome#index'

  get 'login' => 'sessions#new', as: :login
  post 'login' => 'sessions#create'
  get 'logout' => 'sessions#destroy'

  #oauth
  get 'auth/twitter/callback', to: 'sessions#twitter', as: :twitter_auth
  get 'auth/failure', to: 'sessions#failure'

  root 'welcome#index'

end
