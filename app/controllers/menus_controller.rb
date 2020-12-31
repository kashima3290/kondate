class MenusController < ApplicationController
  before_action :authenticate_user!
  def index
    @menus = current_user.menus.includes(:menu_images).order(created_at: :desc).page(params[:page]).per(8)
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
    @menu = Menu.find(params[:id])
    # 配列の数が4未満なら空の配列を入れて要素を４個に保管するする
    @no_menu_count_array = [] # 画像がない枚数を配列に格納
    @noimage_form_count = 4 - @menu.menu_images.count
    @noimage_form_count.times do |i|
      @no_menu_count_array << @menu.menu_images.count + i
    end
  end

  def update
    menu = Menu.find(params[:id])
    # 複数枚画像のパラメータが空の場合は、配列から削除する
    # puts "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh"
    # puts params[:menu][:menu_images_attributes]
    # params[:menu][:menu_images_attributes].each do |key, value|
    #   if value[:id].empty? # 値が空なら、画像配列から削除する
    #     params[:menu][:menu_images_attributes].delete_at(key)
    #   end
    # end
    # binding.pry
    if menu.update(menu_params)
      redirect_to root_path, notice: '編集完了しました'
    else
      redirect_to edit_menu_path, alert: '商品の編集に失敗しました'
    end
  end

  def destroy
  end

  private
  def menu_params
    params.require(:menu).permit(:name, :genre, :site, :text, menu_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end
end
