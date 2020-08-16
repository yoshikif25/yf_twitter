Rails.application.routes.draw do
  devise_for :users
  root "articles#index"
  resources :articles, only: [:index, :new, :create] do
    collection do
      get "notification"
    end
    member do
      get "create_like"
    end
  end
  resources :users, only: :show do
    member do
      get "follow"
    end
  end
end
