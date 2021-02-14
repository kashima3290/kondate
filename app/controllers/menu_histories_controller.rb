class MenuHistoriesController < ApplicationController
  def index
    @menu_histories = current_user.menu_histories.order(eating_date: "DESC").page(params[:page]).per(5)
  end

  def show
  end

  def create
  end

  def edit
  end

  def update
  end

  def delete
  end

end
