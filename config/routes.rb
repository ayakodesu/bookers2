Rails.application.routes.draw do
  root to: "homes#top"
  get "/home/about" => "homes#about", as: "about"
  devise_for :users
  resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy]
  resources :users, only: [:index, :edit, :update, :show, :create]
  delete 'books/:id' =>'books#destroy', as: 'destroy_book'




end
