Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  resources :articles, only: [:index, :new, :create] do
    member do
      get "create_like"
    end
  end
end
