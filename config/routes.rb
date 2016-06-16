require 'api_constraints'

Rails.application.routes.draw do

  namespace :api, defaults: { format: :json }, path: '/api/' do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do

      #users
      resources :users, :only => [:show, :create, :update, :destroy,:index]

      #questions
      resources :questions, :only => [:create]

      #friendship
      resources :friendships, :only => [:index, :create, :destroy]

      #rooms
      resources :rooms, :only => [:index, :create]

      #room_users
      get 'join_room' => 'room_users#join_room'
      delete 'leave_room' => 'room_users#destroy'
      resources :room_users, :only => [:index]

      #game_cards
      get 'unreceived_cards' => 'game_cards#unreceived_cards'
      resources :game_cards, :only => [:index, :update]

      #categories
      resources :categories, :only => [:index]

      #sessions
      delete '/sessions/logout', to: 'sessions#destroy'
      post '/sessions/login', to: 'sessions#create'


      devise_for :users
    end
  end

  root 'static_pages#home'

  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  get 'dashboard' => 'dashboard#index'

  resources :users
  resources :categories
  resources :questions
  resources :cards
  resources :rooms

end
