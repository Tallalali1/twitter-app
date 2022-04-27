Rails.application.routes.draw do
  root 'home#index'
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :tweets do
    resources :reactions
  end

  resources :comments, only: %i[new create destroy] do
    # resources :reactions, only: %i[create]
  end

end
