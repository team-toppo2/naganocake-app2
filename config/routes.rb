Rails.application.routes.draw do
 # 顧客用
 # URL /customers/sign_in ...
 devise_for :customers, controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
 }
 scope module: :customer do
    get 'customer/new', to: 'customer/registrations#new'
    get 'customer/create', to: 'customer/registrations#create'
    get 'customer/new', to: 'customer/sessions#new'
 end
 # 管理者用
 # URL /admin/sign_in ...
 devise_for :admin, controllers: {
  sessions: "admin/sessions"
 }
 namespace :admin do
    get 'admin/new', to: 'admin/sessions#new'
  end

  # 会員側のルーティング設定
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :products, only: [:index, :show]
  resources :customers, only: [:edit, :show, :update]
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw'
  resources :carts_items, only: [:index, :create, :destroy, :update]
  delete 'carts_items/all_destroy' => 'carts_items#all_destroy'
  resources :orders, only: [:index, :create, :show, :new]
  post 'orders/comfirm' => 'orders#comfirm'
  get 'orders/complete' => 'orders#complete'
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]

  # 管理者側のルーティング設定
  namespace :admin do
    get '/' => 'homes#top'
    resources :products, only: [:index, :show, :create, :edit, :update, :new]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end

end
