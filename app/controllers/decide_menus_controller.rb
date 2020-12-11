class DecideMenusController < ApplicationController

  def index
  end

  def random_menu(genre = "")
    # 引数が空なら全てのメニューから選択
    if genre = ""
      @random_menu = Menu.includes(:user).order("RAND()").first
    end
  end

end
