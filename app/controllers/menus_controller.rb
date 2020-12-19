class MenusController < ApplicationController
  before_action :authenticate_user!
  def index
    @menus = Menu.includes(:user).order(created_at: :desc).page(params[:page]).per(2)
  end

  def new
    @menu = Menu.new
    @menu.menu_images.build # file_field作成
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to root_path
    else
      if @menu.errors.details[:menu_images].present?
        @menu.menu_images.build
      end
      render :new
    end
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def menu_params
    params.require(:menu).permit(:name, :genre, :site, :text, menu_images_attributes: [:image]).merge(user_id: current_user.id)
  end
end
