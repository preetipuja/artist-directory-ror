Rails.application.routes.draw do
  get 'users/new'
  get 'welcome/index'
  resources :artists do
    resources :performances
  end

  resources :categories
  resources :users

  resources :artists do
    resources :photos
  end

  resources :artists do
    resources :feedbacks
  end
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  root 'welcome#index'
end

