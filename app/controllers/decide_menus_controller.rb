class DecideMenusController < ApplicationController

  def index
    @random_menu_id = current_user.menus.order("RAND()").first
    @staple_food_menu_id = current_user.menus.where(genre: '主食').order("RAND()").first
    @main_dish_menu_id = current_user.menus.where(genre: '主菜').order("RAND()").first
    @vegetable_menu_id = current_user.menus.where(genre: '野菜').order("RAND()").first
    @one_item_menu_id = current_user.menus.where(genre: '一品もの').order("RAND()").first
    @dessert_menu_id = current_user.menus.where(genre: 'デザート').order("RAND()").first
    @other_menu_id = current_user.menus.where(genre: 'その他').order("RAND()").first
    @eating_out_menu_id = current_user.menus.where(genre: '外食').order("RAND()").first
  end

  def random_menu
    @random_menu = current_user.menus.order("RAND()").first
    judge_extence_junre_menus("", @random_menu)
  end

  def judge_extence_junre_menus(jenre, random_menu)
    puts random_menu
    if random_menu.blank? && jenre != ""
      flash[:alert] = "#{jenre}は登録されていません"
      redirect_to decide_menus_path
    elsif random_menu.blank? && jenre = ""
      flash[:alert] = "ジャンルがあるメニューを登録してください"
      redirect_to decide_menus_path
    end
  end

end
