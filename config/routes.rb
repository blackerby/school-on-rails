Rails.application.routes.draw do
  get '/teachers', to: 'teachers#index'
  get '/teachers/:id', to: 'teachers#show'
end
