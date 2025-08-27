Rails.application.routes.draw do
  root "home#top"
  devise_for :users
  resources :posts, only: [ :index, :new, :create, :show, :destroy ]
end
