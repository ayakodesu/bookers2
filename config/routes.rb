Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "homes#top"
   resources :books, only: [:new, :index, :show, :create]
  get "/homes/about" => "homes#about", as: "about"
  get 'books/new'
  post 'books' => 'books#create'
  get 'books' => 'books#index'
  get 'users/:id/edit' => 'users#edit', as: 'user_book'

end
