Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, except: [:edit, :update, :index, :delete]
  resources :attractions, except: [:delete]

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  post '/rides', to: 'rides#new'

  root 'welcome#home'

end
