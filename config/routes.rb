Commerce::Application.routes.draw do

  

  # front
  devise_for :users
  resources :orders, :only => [:new, :create]
  resources :line_items
  resources :carts

  resources :articles do
    resources :comments
  end


  # back
  namespace :admin do
    get "admin/index"
    resources :categories
    resources :orders
    resources :users
    resources :permissions
    resources :roles

    # resouce au singulier
    # resource :session

    resources :articles do
      resources :comments
    end
  
    resources :products do
      resources :photos
    end

    root :to => 'dashboard#show'
  end

  root :to => 'store#index'

end
