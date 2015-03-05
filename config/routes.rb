Rails.application.routes.draw do
  devise_for :users

  
  resources :documents
  resources :categories
  resources :users


  root to: 'welcome#index'
end

