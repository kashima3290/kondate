class Menu < ApplicationRecord
  has_many :menu_images
  accepts_nested_attributes_for :menu_images, allow_destroy: true
  belongs_to :user
  validates :menu_images, presence: true
  validates :name, presence: true
end
