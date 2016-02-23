Rails.application.routes.draw do
  resources :users, only: [:create, :new]
  resource :session, only: [:create, :new, :destroy]
  resources :subs do
    resources :posts, only: [:new, :create]
  end
  resources :posts, except: [:index, :new, :create] do
    resources :comments, only: [:new, :create]
  end
  resources :comments, except: [:index, :new, :create]

  root 'subs#index'
end
