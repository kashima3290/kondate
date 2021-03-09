class DecideMenusController < ApplicationController

  def index
    @random_menu = current_user.menus.order("RAND()").first
    @staple_food_menu = current_user.menus.where(genre: '主食').order("RAND()").first
    @main_dish_menu = current_user.menus.where(genre: '主菜').order("RAND()").first
    @vegetable_menu = current_user.menus.where(genre: '野菜').order("RAND()").first
    @one_item_menu = current_user.menus.where(genre: '一品もの').order("RAND()").first
    @dessert_menu = current_user.menus.where(genre: 'デザート').order("RAND()").first
    @other_menu = current_user.menus.where(genre: 'その他').order("RAND()").first
    @eating_out_menu = current_user.menus.where(genre: '外食').order("RAND()").first
    @decide_menus = [@random_menu, @staple_food_menu, @main_dish_menu, @vegetable_menu, @main_dish_menu, @vegetable_menu, @one_item_menu, @dessert_menu, @other_menu, @eating_out_menu]
  end

  def random_menu
    @random_menu = current_user.menus.find(params[:id])
    genre = ""
    if judge_extence_junre_menus(genre, @random_menu) == false # ジャンルのメニューが無い場合
      redirect_to decide_menus_path # エラーを出し、画面遷移しない
    end
    @menu_history = MenuHistory.new
    @next_random_menu = current_user.menus.order("RAND()").first
    # 日付が今日の履歴データが存在する場合、updateするためのformを作成するためにview側でhiddenを表示
    today_menu_history_array = MenuHistory.where("eating_date >= ?", Date.today)
    if today_menu_history_array.present?
      today_menu_history = today_menu_history_array[0]
      @menu_ids = []
      today_menu_history.menu_menu_histories_connections.each do |connection|
        @menu_ids << connection.menu_id
      end
    end
  end

  def random_genre_menu
    @random_menu = current_user.menus.find(params[:id])
    genre = @random_menu.genre
    if judge_extence_junre_menus(genre, @random_menu) == false # ジャンルのメニューが無い場合
      redirect_to decide_menus_path # エラーを出し、画面遷移しない
    end
    @menu_history = MenuHistory.new
    @next_random_menu = current_user.menus.where(genre: genre).order("RAND()").first
    # 日付が今日の履歴データが存在する場合、updateするためのformを作成するためにview側でhiddenを表示
    today_menu_history_array = MenuHistory.where("eating_date >= ?", Date.today)
    if today_menu_history_array.present?
      today_menu_history = today_menu_history_array[0]
      @menu_ids = []
      today_menu_history.menu_menu_histories_connections.each do |connection|
        @menu_ids << connection.menu_id
      end
    end
  end

  def judge_extence_junre_menus(genre, random_menu)
    if random_menu.blank? && jenre != ""
      flash[:alert] = "#{genre}は登録されていません"
      return false
    elsif random_menu.blank? && genre == ""
      flash[:alert] = "ジャンルがあるメニューを登録してください"
      return false
    else
      return true
    end
  end

end
