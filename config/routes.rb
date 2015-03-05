Rails.application.routes.draw do
  devise_for :users

  
  resources :documents
  
  
resources :users

# authenticate(:user) do
#   current_user
# end


  root to: 'welcome#index'
end

