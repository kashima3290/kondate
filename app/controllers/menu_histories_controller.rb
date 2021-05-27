class MenuHistoriesController < ApplicationController
  def index
    @menu_histories = current_user.menu_histories.order(eating_date: "DESC").page(params[:page]).per(5)
    today_menu_history = MenuHistory.where("eating_date >= ?",  Date.today)
  end

  def create
    today_menu_history_array = MenuHistory.where("eating_date >= ?", Date.today) # 今日の日付開始より大きい日付（今日登録したデータ）
    # 今日の日付分のデータが既にある場合、今日の日付に紐づくメニューを更新
    if today_menu_history_array.present?
      today_menu_history = today_menu_history_array[0]
      if today_menu_history.update(menu_history_params)
        redirect_to root_path
      else
        redirect_back(fallback_location: root_path) # 前ページにリダイレクト
      end
    else
      # 今日の日付に紐づくメニューが作成されていないときは、新しい日付として作成
      @menu_history = MenuHistory.new(menu_history_params)
      if @menu_history.save
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def update
    menu_history = MenuHistory.find(params[:id])
    # 全部削除されていた場合は履歴自体を削除
    if params[:menu_ids].blank?
      # Menuhistoryを削除
      if menu_history.destroy
        redirect_to menu_histories_path
      else
        render menu_histories_path
      end
    else
      if menu_history.update(menu_history_params)
        redirect_to menu_histories_url, alert: 'エラーが発生しました'
      else
        render menu_histories_path
      end
    end
  end

  private

  def menu_history_params
    params.require(:menu_history).permit(menu_ids: []).merge(user_id: current_user.id, eating_date: Time.new)
  end

end
