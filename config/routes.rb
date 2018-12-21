Rails.application.routes.draw do
  resources :cities
  resources :pages
  resources :navs
  resources :order_items
  resources :orders
  resources :course_ages
  resources :course_categories
  resources :categories
  root 'pages#home'

  resources :course_days
  resources :days
  resources :course_places
  resources :course_niveaus
  resources :courses
  devise_for :members, path: 'members', controllers: { sessions: "members/sessions", registrations: "members", confirmations: "members/confirmations", passwords: "members/passwords", unlocks: "members/unlocks", sessions: "members/sessions" }
  devise_for :coaches, path: 'coaches', controllers: { sessions: "coaches/sessions", registrations: "coaches/registrations", confirmations: "coaches/confirmations", passwords: "coaches/passwords", unlocks: "coaches/unlocks", sessions: "coaches/sessions" }
  resources :members, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  resources :coaches, only: [:index, :show, :edit, :update, :destroy]
  get '/edit-courses', to: 'courses#edit_courses'
  get '/kurv', to: 'order_items#index'
  resources :order_items, path: '/kurv/kurs'
  get 'kurv/sjekk-ut', to: 'orders#new', as: :checkout
  patch '/kurv/sjekk-ut', to: 'orders#create'
  get :search, controller: :application

  get '/personvern', to: 'pages#personvern'
  get '/cookies', to: 'pages#cookies'

  get '/kurs', to: 'courses#index'

end
