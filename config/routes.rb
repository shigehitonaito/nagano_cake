Rails.application.routes.draw do


# 管理者routingd

devise_for :admins, :controllers => {
 :sessions => 'admins/sessions'
}

 namespace :admin do
  	resources :items
  	resources :genres, only: [:index, :create, :edit, :update]
  	get 'end_users' => 'end_users#index'
    resources :orders, only: [:index, :show, :update]
    resources :order_detiles, only: [:update]
  end


# ユーザーrouting


  devise_for :end_users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

namespace :public do
   resource :end_users, only: [:edit, :update, :show]
    delete '/end_users' => 'end_users#hide'
    resources :items, only: [:index, :show]
    get 'end_users/comfilm' => 'end_users#comfilm'
    resources :cart_items
    delete '/cart_items' => 'cart_items#destroy_all', as: :destroy_all
    get 'orders/complete' => 'orders#complete'
    get 'orders/verification' => 'orders#verification'
    resources :orders, only: [:index, :show, :new, :create]
    resources :addresses
  end

  scope module: :public do
  	root 'items#index'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
