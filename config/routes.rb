Rails.application.routes.draw do
  get 'activities/index'
  ActiveAdmin.routes(self)
  root 'home#index'

  get 'home/authentication'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'histories', to: 'histories#index'
  get 'members', to: 'members#index'
  get 'activities', to: 'activities#index'
  get 'contact', to: 'contact#index'

  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }

  devise_scope :user do
    get 'user/:id', to: 'users/registrations#detail'
    get 'signup', to: 'users/registrations#new'
    get 'login', to: 'users/sessions#new'
    get 'logout', to: 'users/sessions#destroy'
  end

  namespace :api, {format: 'json'} do
    namespace :v1 do
      resources :users, only: [:index, :show]
    end
  end
end
