Rails.application.routes.draw do
  root 'welcome#index'

  resources :users, only: [:create]
  resources :flights, only: [:index, :new, :create, :edit, :update]

  get 'sign-out' => 'sessions#destroy'
end
