class MenusController < ApplicationController
  before_action :authenticate_user!
  def index
    @menus = Menu.all.order(created_at: :desc)
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
      render :new
    end
  end

  def show
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
