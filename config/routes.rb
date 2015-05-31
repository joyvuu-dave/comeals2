Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  namespace :api do
    get 'bills/:id' => 'bills#show'
    get 'bills' => 'bills#index'

    get 'meals/:id' => 'meals#show'
    get 'meals' => 'meals#index'

    get 'residents/:id' => 'residents#show'
    get 'residents' => 'residents#index'

    get 'units/:id' => 'units#show'
    get 'units' => 'units#index'
  end
end
