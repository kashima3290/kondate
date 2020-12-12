class DecideMenusController < ApplicationController

  def index
  end

  def random_menu(genre = "")
    # 引数が空なら全てのメニューから選択
    if genre = ""
      @random_menu = Menu.includes(:user).order("RAND()").first
    else
    # 引数があるなら、genreの引数を絞り込み
      @random_menu= Menu.includes(:user).where(genre: genre).order("RAND()").first
    end
  end

end
