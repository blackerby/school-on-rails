Rails.application.routes.draw do
  get 'errors/not_found'
  get 'errors/internal_server_error'
  resources :buildings
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

  match '/404', to: 'errors#not_found', via: :all
  match '/500', to: 'errors#internal_server_error', via: :all
end
