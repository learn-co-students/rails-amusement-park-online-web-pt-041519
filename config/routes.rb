Rails.application.routes.draw do
  resources :users

  resources :admin do
    resources :attractions, only: [:index, :show, :new, :edit]
  end

  root 'welcome#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
