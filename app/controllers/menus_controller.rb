class MenusController < ApplicationController
  before_action :authenticate_user!
  def index
    @menus = Menu.all.order(created_at: :desc)
  end

  def new
    @menu = Menus.new
  end

  def create
    @menu = Menu.new(menu_params)
    if @menu.save
      redirect_to root_path
    else
      render :edit
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
    params.require(:menu).permit(:name, :genre, :title, :text, :user_id);
  end
end
