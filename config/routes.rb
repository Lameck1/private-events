Rails.application.routes.draw do
  get 'events/index'
  get 'events/new'
  get 'events/show'
  get 'users/index'
  get 'users/new'
  get 'users/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :events, only: [:index, :new, :create, :show]
  resources :events_attendances, only: [:create, :destroy, :update]

  root to: 'events#index'

  get 'login' => 'access#new'
  delete 'logout' => 'access#destroy'
end
