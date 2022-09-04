Rails.application.routes.draw do
  resources :departments
  root to: 'teachers#index'

  resources :teachers
end
