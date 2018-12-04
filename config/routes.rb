Rails.application.routes.draw do
  resources :course_ages
  resources :course_categories
  resources :categories
  root 'courses#index'

  resources :course_days
  resources :days
  resources :course_places
  resources :course_niveaus
  resources :courses
  devise_for :members, path: 'members', controllers: { sessions: "members/sessions", registrations: "members/registrations", confirmations: "members/confirmations", passwords: "members/passwords", unlocks: "members/unlocks", sessions: "members/sessions" }
  devise_for :coaches, path: 'coaches', controllers: { sessions: "coaches/sessions", registrations: "coaches/registrations", confirmations: "coaches/confirmations", passwords: "coaches/passwords", unlocks: "coaches/unlocks", sessions: "coaches/sessions" }
end
