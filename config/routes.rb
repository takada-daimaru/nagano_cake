Rails.application.routes.draw do
  namespace :admins do
    get 'orders/index'
    get 'orders/show'
    get 'orders/update'

    get 'customers/index'
    get 'customers/show'
    get 'customers/edit'
    get 'customers/update'

    get 'types/index'
    get 'types/create'
    get 'types/edit'
    get 'types/update'

    get 'items/index'
    get 'items/show'
    get 'items/new'
    get 'items/create'
    get 'items/edit'
    get 'items/update'
    get 'items/top'
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
  get '/orders/thanks', to: 'orders#thanks'
  delete '/customers/cart_items', to: 'cart_items#all_delete'
  # 管理者サイト
  get '/admins/orders/history', to: 'admins/orders#history'

  resource :customers do
    # update :update_status  ここの記述不明です！
    resources :cart_items, only: [:index, :create, :update, :destroy] # do
    #   destroy :all_delete   ここの表記不明です！
  end
  namespace :admins do
    resources :customers, only: [:index, :show, :edit, :update]
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :orders, only: [:index, :show, :update]
    resources :types, only: [:index, :create, :edit, :update]
  end

  resources :items, only: [:index, :show, :new, :create]
  resources :orders, only: [:new, :create, :index, :show]
  resources :shippings, only: [:index, :create, :destroy, :edit, :update]

end
