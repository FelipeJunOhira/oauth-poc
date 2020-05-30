Rails.application.routes.draw do
  use_doorkeeper
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :front do
    resources :sessions, only: [:new, :create] do
      get :logout, on: :collection
    end
  end
end
