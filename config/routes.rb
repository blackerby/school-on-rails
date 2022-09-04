Rails.application.routes.draw do
  resources :classrooms
  root to: 'teachers#index'

  resources :teachers
  resources :departments
  resources :blocks
end
