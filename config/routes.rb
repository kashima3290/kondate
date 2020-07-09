Rails.application.routes.draw do
  devise_for :users
  root 'menus#index'
end
