class MenuHistoriesController < ApplicationController
  def index
    @menu_histories = current_user.menu_histories.order(eating_date: "DESC").page(params[:page]).per(5)
  end

  def show
  end

  def create
    @menu_history = MenuHistory.new(menu_history_params)
    if @menu_history.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  private

  def menu_history_params
    params.require(:menu_history).permit(:menu_id).merge(user_id: current_user.id, eating_date: Time.new)
  end

end
