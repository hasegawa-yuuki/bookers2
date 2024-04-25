Rails.application.routes.draw do
  root :to => 'homes#top'
  devise_for :users
  resources :users, only: [:index, :show, :edit, :update, :destroy]
  resources :books, only: [:index, :show, :edit, :update, :create, :destroy]
  get 'home/about' => 'homes#about'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
