Rails.application.routes.draw do

    get "/about" => "public/homes#about"

  devise_for :admin, controllers: {
    sessions: 'admin/sessions',
  }
  
  namespace :admin do
    get 'top' => 'homes#top', as: 'top'
    get 'search' => 'homes#search', as: 'search'
    get 'users/:user_id/reviews' => 'reviews#index', as: 'user_reviews'
    resources :users, only: [:index, :show, :edit, :update]
    resources :reviews, only: [:index, :show, :edit, :update, :destroy]
    resources :genres, only: [:index, :create, :edit, :update]
  end


  devise_for :users, controllers: {
    sessions: 'public/sessions',
    registrations: 'public/registrations',
  }
  
  devise_scope :user do
    post 'user/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  scope module: :public do
    root 'homes#top'

    get 'users/mypage' => 'users#show', as: 'mypage'
    # users/editのようにするとdeviseのルーティングとかぶってしまうためinformationを付け加えている。
    get 'users/information/edit' => 'users#edit', as: 'edit_information'
    patch 'users/information' => 'users#update', as: 'update_information'
    get 'users/unsubscribe' => 'users#unsubscribe', as: 'confirm_unsubscribe'
    put 'users/information' => 'users#update'
    patch 'users/withdraw' => 'users#withdraw', as: 'withdraw_user'

    resources :reviews, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
end