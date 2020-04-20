Rails.application.routes.draw do
  namespace :admins do
    get 'orders/index'
    get 'orders/id/update'
    get 'orders/show'

    get 'customers/index'
    get 'customers/id/edit'
    get 'customers/id/update'
    get 'customers/show'

    get 'types/index'
    get 'types/create'
    get 'types/id/edit'
    get 'types/id/update'

    get 'items/index'
    get 'items/new'
    get 'items/id/create'
    get 'items/id/edit'
    get 'items/id/update'
    get 'items/top'
    get 'items/show'
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

    resources :cart_items, only: [:index, :create, :update, :destroy] 
     resources :items, only: [:new, :create]
  end

resources :types, only: [:index, :create, :show, :edit, :update]
resources :items, only: [:index, :show ]
resources :orders, only: [:new, :create, :index, :show]
resources :shippings, only: [:index, :create, :destroy, :edit, :update]

end
