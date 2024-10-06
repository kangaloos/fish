Rails.application.routes.draw do
  get 'groups/new'
  get 'groups/index'
  get 'groups/show'
  get 'groups/edit'
  devise_for :users
   resources :groups,except: [:index]
  devise_for :admin, skip: [:registrations, :password], controllers: {
    sessions: 'admin/sessions'
  }


  namespace :admin do
    root "dashboards#index"
    get 'dashboards', to: 'dashboards#index'
    resources :users, only: [:destroy,:show,:index]
    resources :points, only: [:index, :destroy]
    resources :post_comments, only: [:index, :destroy]
    resources :groups, only: [:index, :destroy]

  end

  root to: 'homes#top'
  resources :groups, except: [:index] do
  resource :membership, only: [:create, :destroy]
 end
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
