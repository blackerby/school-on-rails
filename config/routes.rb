Rails.application.routes.draw do
  root to: 'teachers#index'

  resources :departments

  resources :blocks

  resources :classrooms

  resources :teachers do
    resources :meetings
  end
end
