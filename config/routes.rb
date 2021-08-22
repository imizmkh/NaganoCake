Rails.application.routes.draw do

  devise_for :customers
  root to: 'homes#top'
  get 'home/about' => 'homes#about'

  namespace :admin do
    resources :genres, only: [:index, :create, :edit, :update]
    resources :products

  end
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
