Rails.application.routes.draw do
  devise_scope :user do
    root "users/sessions#new"
  end
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: "users/sessions",
    passwords: "users/passwords"
  }
  resources 'menus'
end
