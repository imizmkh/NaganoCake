Rails.application.routes.draw do


  devise_for :customers, skip: 'registrations', controllers: {
    sessions: 'customers/sessions',
    passwords: 'customers/passwords',
    #registrations: 'customers/registrations'
  }
  devise_scope :customers do
    get '/customers/sign_up', to: 'customers/registrations#new', as: :new_customer_registration
    post '/customers', to: 'customers/registrations#create'
  end

  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    passwords: 'admins/passwords',
    registrations: 'admins/registrations'
  }
  get 'customers/my_page', to: 'customers#show'
  get 'customers/edit', to: 'customers#edit'
  patch 'customers/withdraw', to: 'customers#withdraw'
  resources :customers, only: [:update]
  get 'customers/quit', to: 'customers#quit'

  resources :addresses
  resources :items, only: [:index, :show]

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

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
