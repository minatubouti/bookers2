Rails.application.routes.draw do
  devise_for :users
  #get 'users/show'
  #get 'users/edit'
  #get 'books/new'
  #get 'books/index'
  #get 'books/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
 root to: "homes#top"
 get "home/about", to: "homes#about", as: "about"
 resources :books, only: [:new, :index, :show, :create, :update, :destroy]
 resources :users, only: [:show, :edit, :index, :update]
end
