Rails.application.routes.draw do
  root to: 'teachers#index'

  resources :departments

  resources :blocks do
    resources :meetings
  end

  resources :classrooms do
    resources :meetings
  end

  resources :teachers do
    resources :meetings
  end
end
