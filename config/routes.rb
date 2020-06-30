Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dogs, only: [:new, :create, :delete, :index, :edit, :update, :show] do
    resources :applications, only: [:new, :create]
  end

  resources :applications, only: [:edit, :update] do
    resources :entries, except: [:show, :destroy]
    resources :reviews, only: [:new, :create]
  end

  get '/dashboard', to: 'pages#dashboard'
end
