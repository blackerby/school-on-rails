Rails.application.routes.draw do
  root to: 'teachers#index'

  resources :teachers do
    resources :schedules
  end

  resources :departments
  resources :blocks
  resources :classrooms
end
