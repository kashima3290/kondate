class Menu < ApplicationRecord
  has_many :menu_images, dependent: :destroy
  accepts_nested_attributes_for :menu_images, allow_destroy: true
  belongs_to :user
  belongs_to :menu_history
  validates :name, presence: true
  validates :menu_images, presence: true
end
