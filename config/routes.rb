Rails.application.routes.draw do
  resources :users
  resources :attractions

  get '/signin', to: 'sessions#new'
  post '/signin', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/attractions', to: 'attractions#index'


  resources :admin do
    resources :attractions, only: [:index, :show, :new, :edit]
  end

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
