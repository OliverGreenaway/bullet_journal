Rails.application.routes.draw do
  root 'plugins#index'
  resources :plugins
end
