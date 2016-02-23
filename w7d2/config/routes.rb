Rails.application.routes.draw do

  root to: "static_pages#root"

  namespace :api do
    resources :todos, only: [:index, :show, :create, :update, :destroy]
  end
end
