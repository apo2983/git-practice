Rails.application.routes.draw do

  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'books#top'

  get '/home/about' => 'books#about'

  resources :users, only: [:show, :edit, :update, :index]

  resources :books, only: [:index, :show, :create, :edit, :update, :destroy]
end
