class MenuHistoriesController < ApplicationController
  def index
    @menu_histories = current_user.menu_histories.order(eating_date: "DESC")
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
