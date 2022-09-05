Rails.application.routes.draw do
  root to: 'teachers#index'

  resources :teachers do
    resources :schedules, only: %i[create new update destroy]
  end

  resources :departments
  resources :blocks
  resources :classrooms
end
