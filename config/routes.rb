Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [:create, :show, :update]
      resources :sessions, only: [:create]
      resources :favorites, only: [:index, :create] do
        collection { delete :delete_collection }
      end
      resource :avatar, only: [:create]
      resources :blogentries, only: [:index, :show]
      resources :questions, only: [:index]
      resources :products, only: [:index]
      resources :responses, only: [:index, :create, :update] do
        collection { get :report }
      end
    end
  end
end
