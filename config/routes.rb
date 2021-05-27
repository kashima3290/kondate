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
  resources :menu_histories, only: [:index, :show, :create, :update]
  resources :decide_menus do
    member do
      get :random_menu
      get :random_genre_menu
    end
  end
end
