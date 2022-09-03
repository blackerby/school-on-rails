Rails.application.routes.draw do
  get '/teachers', to: 'teachers#index'
end
