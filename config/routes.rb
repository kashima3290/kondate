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
      get :staple_food_menu
      get :random_menu
      get :main_dish_menu
      get :vegetable_menu
      get :one_item_menu
      get :dessert_menu
      get :other_menu
      get :eating_out
    end
  end
  resources :users
end
