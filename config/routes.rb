Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  root 'salons#index'

  resources :salons do
    resources :services, only: %i[new create index show] do
      resources :appointments, only: [:new, :create, :index]
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
