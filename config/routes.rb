Rails.application.routes.draw do
  root to: 'teachers#index'

  resources :departments

  resources :blocks do
    collection do
      get :free_classrooms
    end
  end

  resources :classrooms

  resources :teachers do
    resources :meetings
  end
end
