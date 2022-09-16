Rails.application.routes.draw do
  devise_for :users
  root to: 'blocks#index'

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
