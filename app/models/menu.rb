class Menu < ApplicationRecord
  has_many :menu_images, dependent: :destroy
  has_many :menu_menu_histories_connections, dependent: :destroy #メニューが削除された時は食べた履歴と繋ぐ中間データも削除
  has_many :menu_histories, through: :menu_menu_histories_connections
  accepts_nested_attributes_for :menu_images, allow_destroy: true
  belongs_to :user
  validates :name, presence: true
  validates :menu_images, presence: true
end
