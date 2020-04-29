Rails.application.routes.draw do


# 管理者routingd

devise_for :admins, :controllers => {
 :sessions => 'admins/sessions'
}

 namespace :admin do
  	resources :items
  	resources :genres, only: [:index, :create, :edit, :update]
  	get 'end_users' => 'end_users#index'
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
  end

  scope module: :public do
  	root 'items#index'
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end