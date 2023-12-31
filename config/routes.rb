Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root :to =>"homes#top"
  get "home/about"=>"homes#about"
  devise_for :users
  resources :books, only: [:index,:show,:edit,:create,:destroy,:update] do
     resource :favorite, only: [:create, :destroy]
     resources :book_comments, only: [:create,:destroy]
  end
  resources :users, only: [:index,:show,:edit,:update] do
    get "search" => "users#search"
    member do
      get :follows, :followers
    end
      resource :relationships, only: [:create, :destroy]
  end
  resources :messages, only: [:create]
  resources :rooms, only: [:create,:show]
  get "search" => "searches#search"
  get "search_tag" => "books#search_tag"
    
  
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
