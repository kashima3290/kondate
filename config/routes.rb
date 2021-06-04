Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
    passwords: "users/passwords"
  }
  root "menus#index"
  resources :users
  resources :menus do
    collection do
      get :menu_search
    end
  end
  resources :menu_histories, only: [:index, :show, :create, :update] do
    collection do
      get :menu_history_search
    end
  end
  resources :decide_menus do
    member do
      post :select_random_menu
      get :random_menu
    end
  end
end
