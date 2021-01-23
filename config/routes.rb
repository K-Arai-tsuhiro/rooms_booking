Rails.application.routes.draw do
  devise_for :users,
    controllers: { registrations: 'registrations' }
    
  root 'pages#home'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/rooms/posted', to: 'rooms#posted', as: 'posted'
  resources :rooms, only: [:new, :create, :index, :show]
  resources :reservations, only: [:create, :index]
  resources :profiles, only: %i(edit update show)
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
