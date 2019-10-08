Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#welcome' 
  resources :users
  resources :attractions

  get '/signin' => 'sessions#new', as: 'signin'
  post '/signin' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
