Rails.application.routes.draw do
  get '/kurs', to: 'courses#index'
  resources :emails
  get '/send-email', to: 'emails#send_email'
  resources :contact_people
  get '/kontaktperson', to: 'contact_people#new'
  post '/kontaktperson', to: 'contact_people#create'
  get '/legg-til-kontaktperson', to: 'contact_people#legg_til_kontaktperson'
  post '/legg-til-kontaktperson', to: 'contact_people#create'
  get '/legg-til-kontakt-person', to: 'contact_people#legg_til_kontakt_person'
  post '/legg-til-kontakt-person', to: 'contact_people#create'
  resources :grandparents
  get '/besteforeldre', to: 'grandparents#new'
  post '/besteforeldre', to: 'grandparents#create'
  get '/legg-til-besteforeldre', to: 'grandparents#legg_til_besteforelder'
  post '/legg-til-besteforeldre', to: 'grandparents#create'
  get '/legg-til-beste-foreldre', to: 'grandparents#legg_til_beste_forelder'
  post '/legg-til-beste-foreldre', to: 'grandparents#create'
  resources :children
  get '/deltaker', to: 'children#deltaker'
  post '/deltaker', to: 'children#create'
  get '/ny-deltaker', to: 'children#ny_deltaker'
  post '/ny-deltaker', to: 'children#create'
  get '/legg-til-deltaker', to: 'children#legg_til_deltaker'
  post '/legg-til-barn', to: 'children#create'
  get '/barn/flere', to: 'children#flere'
  post '/barn/flere', to: 'children#create'
  resources :people
  mount Ckeditor::Engine => '/ckeditor'
  resources :sub_navs
  resources :contents
  resources :participations
  get '/ventende', to: 'participations#pending'
  resources :cities
  resources :pages
  resources :navs
  resources :order_items
  get 'mine-kurs', to: 'orders#index'
  resources :orders do
    resources :grandparents
    get '/bedsteforelder', to: 'grandparents#new'
    resources :contact_people
    get '/kontaktperson', to: 'contact_people#new'
  end
  resources :course_ages
  resources :course_categories
  resources :categories
  root 'pages#home'
  get '/rediger', to: 'pages#rediger'
  get '/oversigt', to: 'courses#oversigt'

  resources :course_days
  resources :days
  resources :course_places
  resources :course_niveaus
  resources :courses
  devise_for :members, path: 'members', controllers: { sessions: "members/sessions", registrations: "members/registrations", confirmations: "members/confirmations", passwords: "members/passwords", unlocks: "members/unlocks", sessions: "members/sessions" }
  resources :members, only: [:index, :show, :new, :edit, :create, :destroy, :gdpr] do
    resources :participations, controller: 'members/participations'
    get '/gdpr', to: 'members#gdpr'
  end
  get '/kontoer', to: 'members#kontoer'
  get '/deltakere', to: 'participations#index'
  post '/ventende', to: 'participations#pending'
  namespace 'deltakere' do
    resources :courses, controller: '/courses'
  end
  devise_scope :member do
    get '/logg-in', to: 'members/sessions#new'
    post '/logg-in', to: 'members/sessions#create'
    get '/registrer', to: 'members/registrations#new'
    post '/registrer', to: 'members/registrations#create'
    get '/:id/rediger-konto', to: 'members#edit', as: :rediger_konto
    post '/:id/rediger-konto', to: 'members#update'
    get '/:id/konto', to: 'members#show'
    get '/members/edit', to: 'members/registrations#edit'
    post '/members/:id', to: 'members/registrations#update'
  end
  devise_for :coaches, path: 'coaches', controllers: { sessions: "coaches/sessions", registrations: "coaches/registrations", confirmations: "coaches/confirmations", passwords: "coaches/passwords", unlocks: "coaches/unlocks", sessions: "coaches/sessions" }
  devise_scope :coach do
    get '/admin', to: 'coaches/sessions#new'
  end
  resources :coaches, only: [:index, :show, :edit, :update, :destroy]
  get '/edit-courses', to: 'courses#edit_courses'
  get '/kurv', to: 'order_items#index'
  resources :order_items, path: '/kurv/kurs'
  get 'kurv/sjekk-ut', to: 'orders#new', as: :checkout
  patch '/kurv/sjekk-ut', to: 'orders#create'
  get :search, controller: :application

  get '/personvern', to: 'pages#personvern'
  get '/cookies', to: 'pages#cookies'

  get "/404", :to => "errors#not_found", :via => :all
  get "/500", :to => "errors#internal_server_error", :via => :all
end
