Rails.application.routes.draw do

# 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords,], controllers: {
  registrations: "customer/registrations",
  sessions: 'customer/sessions'
}

# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
 namespace :admin do
    get 'admin/new', to: 'admin/sessions#new'
  end

  # 会員側のルーティング設定
  scope module: :customer do
  root to: 'homes#top'
  get '/about' => 'homes#about'
  resources :products, only: [:index, :show]
  get 'customers/unsubscribe' => 'customers#unsubscribe', as: 'unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw', as: 'withdraw'
  resources :customers, only: [:edit, :show, :update]
  get 'customers/unsubscribe' => 'customers#unsubscribe'
  patch 'customers/withdraw' => 'customers#withdraw'
  delete 'cart_items/all_destroy' => 'cart_items#all_destroy'
  resources :cart_items, only: [:index, :create, :destroy, :update]
  resources :orders, only: [:index, :create, :show, :new] do
    collection do
      get :complete
      post :comfirm
    end
  end
  resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end

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
