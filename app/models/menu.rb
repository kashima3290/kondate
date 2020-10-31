class Menu < ApplicationRecord
  has_many :menu_images, dependent: :destroy
  accepts_nested_attributes_for :menu_images
  belongs_to :user
  validates :menu_images, presence: true
  validates :name, presence: true
end
