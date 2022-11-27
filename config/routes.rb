Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:show, :edit,:update,:index]
  resources :books, only: [:new,:index,:show,:edit,:create,:destroy,:update]
  get 'homes/top'
  root to: "homes#top"
  get "/home/about" => "homes#about",as: 'about'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
