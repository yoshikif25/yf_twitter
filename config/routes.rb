Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  resource :articles, only: [:index, :new, :create]
end
