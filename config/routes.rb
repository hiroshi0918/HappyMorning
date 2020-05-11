Rails.application.routes.draw do
  get 'user_items/edit'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, :controllers => {
    :registrations => 'users/registrations', 
    :omniauth_callbacks => "omniauth_callbacks"
  } 
  root 'shops#index'
  resources :shops, only: [:index] do
    resources :foods, only: [:index, :show]
    namespace :admin do
      resources :shops, only: [:index, :new, :create, :show,  :edit, :destroy]
    end
  end
  
  resources :users, only: [:index,:show] do
    resources :user_items,only:[:index,:create,:update,:destroy]
  end

  resources :order_items,only:[:index,:create] do
    collection do
      post 'pay/:id'=>   'order_items#pay', as: 'pay'
      get  'done'=>      'order_items#done', as: 'done'
    end
  end
  

  resources :cards, only: [:new, :show] do
    collection do
      post 'show', to: 'cards#show'
      post 'pay', to: 'cards#pay'
      post 'delete', to: 'cards#delete'
    end
  end

  
end
