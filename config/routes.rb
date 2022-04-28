Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tweets do
    resources :reactions, only: %i[create destroy]
  end

  resources :comments, only: %i[new create destroy]

  resources :users, only: %i[index show] do
    resources :follows
  end

end
