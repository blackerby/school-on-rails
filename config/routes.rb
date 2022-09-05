Rails.application.routes.draw do
  root to: 'teachers#index'

  resources :teachers do
    resources :schedules, except: :index do
      resources :meetings
    end
  end

  resources :departments
  resources :blocks
  resources :classrooms
end
