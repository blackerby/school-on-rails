Rails.application.routes.draw do
  root to: 'teachers#index'

  resources :departments, only: %i[index show]

  resources :blocks, only: %i[index show]

  resources :classrooms, only: %i[index show]

  resources :teachers, only: %i[index show] do
    resources :meetings
  end
end
