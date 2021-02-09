class Menu < ApplicationRecord
  has_many :menu_images, dependent: :destroy
  has_many :menu_menu_histories_connections, dependent: :destroy
  accepts_nested_attributes_for :menu_images, allow_destroy: true
  belongs_to :user
  validates :name, presence: true
  validates :menu_images, presence: true
end
