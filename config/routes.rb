Rails.application.routes.draw do
  devise_for :users
  root to: "homes#top"
   resources :books, only: [:new, :index, :show, :create, :edit, :update, :destroy]
   resources :users, only: [:index, :edit, :update, :show, :create]

    delete 'books/:id' =>'books#destroy', as: 'destroy_book'
   


end
