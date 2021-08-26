Rails.application.routes.draw do

  get "customers/my_page", to: 'customers#show'
  get "customers/edit", to: 'customers#edit'

  devise_for :customers
  root to: 'homes#top'
  get '/about' => 'homes#about'
  get '/items' => 'items#index'
  get '/items/:id' => 'items#show'

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products

  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
