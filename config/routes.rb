Rails.application.routes.draw do
  devise_for :users

  # 会員側のルーティング設定
  root to: 'public/homes#top'
  get '/about' => 'public/homes#about'
  resources :products, only: [:index, :show]
  resources :customers, only: [:edit, :show, :update]
  get 'customers/unsubscribe' => 'public/customers#unsubscribe'  
  patch 'customers/withdraw' => 'public/customers#withdraw'
  resources :carts_items, only: [:index, :create, :destroy, :update]
  delete 'carts_items/all_destroy' => 'public/carts_items#all_destroy'
  resources :orders, only: [:index, :create, :show, :new]
  post 'orders/comfirm' => 'orders#comfirm'
  get 'orders/complete' => 'orders#complete'
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  
  # 管理者側のルーティング設定
  namespace :admin do
    get '/admin' => 'admin/homes#top'
    resources :products, only: [:index, :show, :create, :edit, :update, :new]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end
