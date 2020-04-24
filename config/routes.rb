Rails.application.routes.draw do
  namespace :admins do
    get 'search/search'
  end
    # 管理者サイト
  namespace :admins do
    get '/orders/top', to: 'orders#top'
    get '/orders', to: 'orders#history'
    get '/search', to: 'search#search'
    resources :order_items, only: [:update]
    resources :orders, only: [:show, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :types, only: [:index, :create, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
  end

  devise_for :admins, controllers: {
    sessions:      'admins/sessions',
    passwords:     'admins/passwords',
    registrations: 'admins/registrations'
  }
  devise_for :customers, controllers: {
    sessions:      'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  # ECサイト
  root 'items#top'
  get '/items/top', to: 'items#top'
  get '/items/about', to: 'items#about'
  get '/customers/cart_items/all_delete', to: 'cart_items#all_delete'
  get '/orders/confirm', to: 'orders#confirm'
  post '/orders/confirm', to: 'orders#confirm'
  get '/orders/thanks', to: 'orders#thanks'
  delete '/customers/cart_items', to: 'cart_items#all_delete'


  resource :customers do
    # update :update_status  ここの記述不明です！
    resources :cart_items, only: [:index, :create, :update, :destroy]
   
  end
  get '/customers/status', to: 'customers#status'
  post '/customers/status', to: 'customers#update_status'
  get '/customer/edit', to:"customers#edit"
  patch '/customer/edit', to:"customers#update"
  put '/customer/edit', to:"customers#update"
  get 'customer/passwords/edit', to:"customers#passwords"
  patch '/customer/passwords/edit' ,to: "customers#passwordsupdate"
  put   '/customer/passwords/edit' ,to: "customers#passwordsupdate"

resources :types, only: [:index, :create, :show, :edit, :update]
resources :items, only: [:index, :show ]
resources :orders, only: [:new, :create, :index, :show]
resources :shippings, only: [:index, :create, :destroy, :edit, :update]

end
