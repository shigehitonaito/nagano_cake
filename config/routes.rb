Rails.application.routes.draw do


# 管理者routingd

devise_for :admins, :controllers => {
 :sessions => 'admins/sessions'
}

 namespace :admin do
  	resources :items
  end


# ユーザーrouting


  devise_for :end_users, :controllers => {
 :registrations => 'users/registrations',
 :sessions => 'users/sessions'
}

namespace :public do
   resource :end_users
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
