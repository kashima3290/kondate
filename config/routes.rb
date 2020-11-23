Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
    passwords: "users/passwords"
  }
  root "menus#index"
  resources :menus
  resources :decide_menus do
    collection do
      get :random_menu
    end
  end
  resources :users
end
