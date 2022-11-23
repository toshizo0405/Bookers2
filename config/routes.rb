Rails.application.routes.draw do
  devise_for :users
  get "/home/about" => "homes#about",as: 'about'
  resources :users, only: [:show, :edit,:update,:index]
  resources :books, only: [:new,:index,:show,:edit,:create,:destroy,:update]
  get 'homes/top'
  root to: "homes#top"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
