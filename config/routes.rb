Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
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
