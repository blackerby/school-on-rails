Rails.application.routes.draw do
  root to: 'teachers#index'

  resources :teachers do
    resources :schedules, except: %i[index show]
  end

  resources :departments
  resources :blocks
  resources :classrooms
end
