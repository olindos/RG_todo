Rails.application.routes.draw do
  devise_for :users

  resources :projects do
    resources :tasks, on: :collection
  end

root to: 'projects#index'
end
