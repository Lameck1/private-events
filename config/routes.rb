Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :users
  resources :events, only: [:index, :new, :create, :show]

  resources :event_attendances

  root to: 'events#index'

  get 'login' => 'access#new'
  post   'login'   => 'access#create'
  delete 'logout' => 'access#destroy'

end
