Rails.application.routes.draw do
  
  devise_for :users
  root to: 'books#top'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:show, :edit, :update, :index, ]
  resources :books
  get 'home/about' => 'books#about'
  
end
