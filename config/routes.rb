Rails.application.routes.draw do
  resources :clients
  delete 'clients/:id', to: 'clients#destroy', as: :delete_client
  root 'clients#index'
end
