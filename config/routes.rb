Rails.application.routes.draw do


  get 'customers/my_page', to: 'customers#show'
  get 'customers/edit', to: 'customers#edit'
  resources :customers, only: [:update]
  get 'customers/quit', to: 'customers#quit'
  patch 'customers/withdraw', to: 'customers#withdraw'

  resources :addresses
  resources :items, only: [:index, :show]

  devise_for :customers
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/items' => 'items#index'
  get '/items/:id' => 'items#show'


  resources :cart_items, only: [:index, :create, :update, :destroy] do
    collection do
      delete 'destroy_all'
    end
  end


  get 'orders/thanks', to: 'orders#thanks'

  resources :orders, only: [:new, :index, :show, :create] do
    collection do
      post :info
    end
  end





  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products
    resources :customers, only: [:index, :edit, :show, :update]

  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
