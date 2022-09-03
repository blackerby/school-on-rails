Rails.application.routes.draw do
  root to: 'teachers#index'

  get '/teachers', to: 'teachers#index'
  get '/teachers/:id', to: 'teachers#show', as: 'teacher'
  get '/teachers/:id/edit', to: 'teachers#edit', as: 'edit_teacher'
  patch '/teachers/:id', to: 'teachers#update'
end
