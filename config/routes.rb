Rails.application.routes.draw do
  root 'application#index'

  resources :attractions
  post '/attractions' => 'attractions#create'
  post '/rides' => 'attractions#ride'

  resources :users, only: [:new, :create, :show]

  get '/signin' => 'sessions#new'
  post '/signin' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

end
