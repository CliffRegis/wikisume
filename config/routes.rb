Rails.application.routes.draw do
  devise_for :users

  
  resources :documents
  
  
resources :users

# authenticate(:user) do
#   get '/users', to: 'users#show'
# end


  root to: 'welcome#index'
end

