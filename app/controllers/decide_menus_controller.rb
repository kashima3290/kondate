class DecideMenusController < ApplicationController

  def index
  end

  def random_menu
    @random_menu = Menu.includes(:user).order("RAND()").first
    judge_extence_junre_menus("", @random_menu)
  end

  def staple_food_menu
    @random_menu = Menu.includes(:user).where(genre: '主食').order("RAND()").first
    judge_extence_junre_menus("主食", @random_menu)
  end

  def main_dish_menu
    @random_menu = Menu.includes(:user).where(genre: '主菜').order("RAND()").first
    judge_extence_junre_menus("主菜", @random_menu)
  end

  def vegetable_menu
    @random_menu = Menu.includes(:user).where(genre: '野菜').order("RAND()").first
    judge_extence_junre_menus("野菜", @random_menu)
  end

  def one_item_menu
    @random_menu = Menu.includes(:user).where(genre: '一品もの').order("RAND()").first
    judge_extence_junre_menus("一品もの", @random_menu)
  end

  def dessert_menu
    @random_menu = Menu.includes(:user).where(genre: 'デザート').order("RAND()").first
    judge_extence_junre_menus("デザート", @random_menu)
  end

  def other_menu
    @random_menu = Menu.includes(:user).where(genre: 'その他').order("RAND()").first
    judge_extence_junre_menus("その他", @random_menu)
  end

  def eating_out
    @random_menu = Menu.includes(:user).where(genre: '外食').order("RAND()").first
    judge_extence_junre_menus("外食", @random_menu)
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
