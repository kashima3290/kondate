class DecideMenusController < ApplicationController

  def index
  end

  def random_menu
    @random_menu = Menu.includes(:user).order("RAND()").first
  end

end
