class Menu < ApplicationRecord
  has_many :menu_images, dependent: :destroy
  belongs_to :user
end
