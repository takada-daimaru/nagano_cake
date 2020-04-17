Rails.application.routes.draw do
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

  resource :customers do
    # update :update_status  ここの記述不明です！
    resources :cart_items, only: [:index, :create, :update, :destroy] # do
    #   destroy :all_delete   ここの表記不明です！
    # end
  end

  resources :items, only: [:index, :show, :new, :create]
  resources :orders, only: [:new, :create, :index, :show]
  resources :shippings, only: [:index, :create, :destroy, :edit, :update]

  root 'items#top'
  get '/items/top', to: 'items#top'
  get '/items/about', to: 'items#about'
  get '/customers/cart_items/all_delete', to: 'cart_items#all_delete'
  get '/orders/confirm', to: 'orders#confirm'
  get '/orders/thanks', to: 'orders#thanks'
end
