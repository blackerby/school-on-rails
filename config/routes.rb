Rails.application.routes.draw do
  resources :meetings
  root to: 'teachers#index'

  resources :teachers

  resources :departments
  resources :blocks
  resources :classrooms
end
