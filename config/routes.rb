Rails.application.routes.draw do

  root to: 'public/homes#top'

  devise_for :customers, controllers: {
    sessions: 'public/customers/sessions',
    passwords: 'public/customers/passwords',
    registrations: 'public/customers/registrations'
  }


  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
    passwords: 'admin/passwords',
    registrations: 'admin/registrations'
  }



  get '/about' => 'public/homes#about'
  get '/items' => 'public/items#index'
  get '/items/:id', to: 'public/items#show', as: 'item'

scope module: :public do
  get 'customers/my_page', to: 'customers#show'
  get 'customers/edit', to: 'customers#edit'
  patch 'customers/withdraw', to: 'customers#withdraw'
  resources :customers, only: [:update]
  get 'customers/quit', to: 'customers#quit'

  resources :addresses

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

 end

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products
    resources :customers, only: [:index, :edit, :show, :update]
    resources :orders, only: [:show]
    get '/' => 'homes#top'

  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
