Rails.application.routes.draw do
  root to: 'teachers#index'

  resources :teachers
  resources :departments
end
