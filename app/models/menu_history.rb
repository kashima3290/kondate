class MenuHistory < ApplicationRecord
  belongs_to :user
  has_many :menu_menu_histories_connections
end
