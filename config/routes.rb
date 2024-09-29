Rails.application.routes.draw do
  #devise_for :admins #ここは削除
  #mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }
  
  namespace :admin do
    root "dashboards#index"
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy]
  end

  root to: 'homes#top'
  get  '/home/about' => 'homes#about'

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    #resources :posts do
    # resources :post_comments
    # resources :post_comments, only: [:create, :destroy]
    #end
  end

  resources :users
  resources :points do
    resource :favorite, only: [:create, :destroy]
    resources :post_comments, only: [:create, :destroy]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
