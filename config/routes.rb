Rails.application.routes.draw do
  root "articles#index"
  resource :articles, only: [:index, :new, :create]
end
