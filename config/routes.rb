Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  get  '/home/about' => 'homes#about'

resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resources :post_comments, only: [:create]
    resources :posts do
     resources :post_comments
   end
  end

  resources :users
  resources :points
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
