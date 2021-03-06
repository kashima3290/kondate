class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :menu_search

  def menu_search
    @q = Menu.ransack(params[:q]) # 検索オブジェクトを生成
    @menus = @q.result.includes(:menu_images).order(created_at: :desc).page(params[:page]).per(8)
  end

  protected

  def configure_permitted_parameters
    added_attrs = [ :email, :name, :password, :password_confirmation ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end

end
