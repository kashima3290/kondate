class DecideMenusController < ApplicationController

  def index
  end

  def random_menu
    @random_menu = Menu.includes(:user).order("RAND()").first
  end

  def main_dish_menu
    @random_menu= Menu.includes(:user).where(genre: '主菜').order("RAND()").first
  end

  def vegetable_menu
    @random_menu= Menu.includes(:user).where(genre: '野菜').order("RAND()").first
  end

  def one_item_menu
    @random_menu= Menu.includes(:user).where(genre: '一品もの').order("RAND()").first
  end

  def dessert_menu
    @random_menu= Menu.includes(:user).where(genre: 'デザート').order("RAND()").first
  end

  def other_menu
    @random_menu= Menu.includes(:user).where(genre: 'その他').order("RAND()").first
  end

  def eating_out
    @random_menu= Menu.includes(:user).where(genre: '外食').order("RAND()").first
  end

end
